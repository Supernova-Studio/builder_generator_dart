// Copyright (c) 2016, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

library data_class_generator.source_field;

import 'package:analyzer/dart/analysis/results.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';

import 'dart_types.dart';
import 'fields.dart';
import 'fixes.dart';
import 'metadata.dart';

part 'value_source_field.g.dart';

const _suggestedTypes = <String, String>{
  'List': 'BuiltList',
  'Map': 'BuiltMap',
  'Set': 'BuiltSet',
  'ListMultimap': 'BuiltListMultimap',
  'SetMultimap': 'BuiltSetMultimap',
};

abstract class ValueSourceField
    implements Built<ValueSourceField, ValueSourceFieldBuilder> {
  ParsedLibraryResult get parsedLibrary;

  FieldElement get element;

  @nullable
  FieldElement get builderElement;

  factory ValueSourceField(ParsedLibraryResult parsedLibrary,
          FieldElement element, FieldElement builderElement) =>
      _$ValueSourceField._(
          parsedLibrary: parsedLibrary,
          element: element,
          builderElement: builderElement);

  ValueSourceField._();

  @memoized
  String get name => element.displayName;

  //todo getter ->declaration?
  @memoized
  String get type => DartTypes.getName(element.getter.returnType);

  @memoized
  bool get isFunctionType => type.contains('(');

  /// The [type] plus any import prefix.
  @memoized
  String get typeWithPrefix {
    var typeFromAst =
        (parsedLibrary.getElementDeclaration(element.declaration).node)
                ?.thisOrAncestorOfType()
                ?.toSource() ??
            'dynamic';
    var typeFromElement = type;

    // If the type is a function, we can't use the element result; it is
    // formatted incorrectly.
    if (isFunctionType) return typeFromAst;

    // If the type does not have an import prefix, prefer the element result.
    // It handles inherited generics correctly.
    if (!typeFromAst.contains('.')) return typeFromElement;

    return typeFromAst;
  }

  /// Returns the type with import prefix if the compilation unit matches,
  /// otherwise the type with no import prefix.
  String typeInCompilationUnit(CompilationUnitElement compilationUnitElement) {
    return compilationUnitElement == element.library.definingCompilationUnit
        ? typeWithPrefix
        : type;
  }

  @memoized
  bool get isGetter => element.getter != null && !element.getter.isSynthetic;

  @memoized
  bool get isNullable => element.getter.metadata
      .any((metadata) => metadataToStringValue(metadata) == 'nullable');

  static BuiltList<ValueSourceField> fromClassElements(
      ParsedLibraryResult parsedLibrary,
      ClassElement classElement,
      ClassElement builderClassElement) {
    var result = ListBuilder<ValueSourceField>();

    for (var field in collectFields(classElement)) {
      if (!field.isStatic &&
          field.getter != null &&
          (field.getter.isAbstract || field.getter.isSynthetic)) {
        final builderField = builderClassElement?.getField(field.name);
        result.add(ValueSourceField(parsedLibrary, field, builderField));
      }
    }

    return result.build();
  }

  Iterable<GeneratorError> computeErrors() {
    var result = <GeneratorError>[];

    if (type == 'dynamic') {
      result.add(GeneratorError((b) => b
        ..message = 'Make field $name have non-dynamic type. '
            'If you are already specifying a type, '
            'please make sure the type is correctly imported.'));
    }

    if (name.startsWith('_')) {
      result.add(GeneratorError((b) =>
          b..message = 'Make field $name public; remove the underscore.'));
    }

//    if (_suggestedTypes.keys.contains(type)) {
//      result.add(GeneratorError((b) => b
//        ..message = 'Make field "$name" have type "${_suggestedTypes[type]}". '
//            'The current type, "$type", is not allowed because it is mutable.'));
//    }

    return result;
  }
}
