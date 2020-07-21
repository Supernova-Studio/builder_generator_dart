// Copyright (c) 2016, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

library data_class_generator.source_field;

import 'package:analyzer/dart/analysis/results.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:data_class/src/data_class_annotation.dart';

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

  factory ValueSourceField(
          ParsedLibraryResult parsedLibrary, FieldElement element) =>
      _$ValueSourceField._(parsedLibrary: parsedLibrary, element: element);

  ValueSourceField._();

  @memoized
  String get name => element.displayName;

  @memoized
  DataClassField get settings {
    var annotations = element.metadata
        .map((annotation) => annotation.computeConstantValue())
        .where((value) => DartTypes.getName(value?.type) == 'DataClassField');

    if (annotations.isEmpty) return const DataClassField();
    var annotation = annotations.single;

    return DataClassField(
      ignoreForBuilder:
          annotation.getField('ignoreForBuilder')?.toBoolValue() ?? false,
    );
  }

//  firstWhere(
//      (element) => element.element.name == 'DataClassField',
//      orElse: () => null);

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

  static String _toBuilderType(DartType type, String displayName) {
    if (DartTypes.isBuiltCollection(type)) {
      return displayName
          .replaceFirst('Built', '')
          .replaceFirst('<', 'Builder<');
    } else if (DartTypes.isDataClass(type)) {
      return displayName.contains('<')
          ? displayName.replaceFirst('<', 'Builder<')
          : '${displayName}Builder';
    } else {
      return displayName;
    }
  }

  /// Gets the type name for the builder. Specify the compilation unit to
  /// get the name for as [compilationUnit]; this affects whether an import
  /// prefix is used. Pass `null` for [compilationUnit] to just omit the prefix.
  String typeInBuilder(CompilationUnitElement compilationUnit) =>
      _toBuilderType(
          element.getter.returnType, typeInCompilationUnit(compilationUnit));

  @memoized
  bool get isNestedBuilder =>
      DartTypes.needsNestedBuilder(element.getter.returnType);

  static BuiltList<ValueSourceField> fromClassElements(
      ParsedLibraryResult parsedLibrary, ClassElement classElement) {
    var result = ListBuilder<ValueSourceField>();

    for (var field in collectFields(classElement)) {
      if (!field.isStatic &&
          field.getter != null &&
          (field.getter.isAbstract || field.getter.isSynthetic)) {
        result.add(ValueSourceField(parsedLibrary, field));
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

    // Type can be specified with or without generic part.
    var typeWithoutGenerics = type.contains('<')
        ? type.replaceRange(type.indexOf('<'), type.length, '')
        : type;

    // Checks if this member's type is mutable and returns the immutable replacement.
    var suggestedType = _suggestedTypes[typeWithoutGenerics];
    if (suggestedType != null) {
      result.add(GeneratorError((b) => b
        ..message = 'Make field "$name" have type "$suggestedType". '
            'The current type, "$typeWithoutGenerics", is not allowed because it is mutable.'));
    }

    return result;
  }
}
