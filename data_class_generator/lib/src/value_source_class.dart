// Copyright (c) 2016, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

library data_class_generator.source_class;

import 'package:analyzer/dart/analysis/results.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:quiver/iterables.dart';
import 'package:source_gen/source_gen.dart';

import 'dart_types.dart';
import 'fixes.dart';
import 'strings.dart';
import 'value_source_field.dart';

part 'value_source_class.g.dart';

const String _importWithSingleQuotes =
    "import 'package:data_class/data_class.dart'";
const String _importWithDoubleQuotes =
    'import "package:data_class/data_class.dart"';

abstract class ValueSourceClass
    implements Built<ValueSourceClass, ValueSourceClassBuilder> {
  ClassElement get element;

  factory ValueSourceClass(ClassElement element) =>
      _$ValueSourceClass._(element: element);

  ValueSourceClass._();

  @memoized
  ParsedLibraryResult get parsedLibrary =>
      element.library.session.getParsedLibraryByElement(element.library);

  @memoized
  String get name => element.displayName;

  @memoized
  String get builderName => '${name}Builder$_generics';

  /// Returns the generated extension name part. If the manually
  /// maintained class is private then we ignore the underscore here, to avoid
  /// returning a class name starting `_$_`.
  @memoized
  String get extPartName =>
      name.startsWith('_') ? '_\$${name.substring(1)}' : '_\$$name';

  @memoized
  BuiltList<String> get genericParameters =>
      BuiltList<String>(element.typeParameters.map((e) => e.name));

  @memoized
  BuiltList<String> get genericBounds =>
      BuiltList<String>(element.typeParameters.map((element) {
        var bound = element.bound;
        if (bound == null) return '';
        return DartTypes.getName(bound);
      }));

  @memoized
  ClassDeclaration get classDeclaration {
    return parsedLibrary.getElementDeclaration(element).node
    as ClassDeclaration;
  }

  @memoized
  BuiltList<ValueSourceField> get fields =>
      ValueSourceField.fromClassElements(parsedLibrary, element);

  /// Default constructor to be used to rebuild the data class.
  @memoized
  ConstructorElement get constructor => element.constructors
      .firstWhere((element) => element.displayName == '', orElse: () => null);

  /// Fields which can be set using default constructor.
  @memoized
  BuiltList<ValueSourceField> get ctorFields {
    var paramNames = constructor.parameters.map((e) => e.name);
    return BuiltList<ValueSourceField>.from(
        fields.where((field) => paramNames.contains(field.name)));
  }

  @memoized
  String get source =>
      element.library.definingCompilationUnit.source.contents.data;

  @memoized
  String get partStatement {
    var fileName = element.library.source.shortName.replaceAll('.dart', '');
    return "part '$fileName.g.dart';";
  }

  @memoized
  bool get hasPartStatement {
    var expectedCode = partStatement;
    return source.contains(expectedCode);
  }

  @memoized
  bool get hasDataClassImportWithShow {
    // It would be more accurate to check using the AST, but this is
    // potentially expensive. We already have the source for the "part of"
    // check, use that.
    return source.contains('$_importWithSingleQuotes show') ||
        source.contains('$_importWithDoubleQuotes show');
  }

  @memoized
  bool get hasDataClassImportWithAs {
    // It would be more accurate to check using the AST, but this is
    // potentially expensive. We already have the source for the "part of"
    // check, use that.
    return source.contains('$_importWithSingleQuotes as') ||
        source.contains('$_importWithDoubleQuotes as');
  }

  @memoized
  bool get dataClassIsAbstract => element.isAbstract;

  /// Returns the `implements` clause for the builder.
  ///
  /// All builders implement `Builder`.
  ///
  /// Additionally, if the value class implements other value classes, the
  /// builder implements the corresponding builders.
  @memoized
  BuiltList<String> get builderImplements => BuiltList<String>.build((b) => b
    ..add('DataClassBuilder<$name$_generics, ${builderName}>')
    ..addAll(element.interfaces
        .where((interface) => needDataClass(interface.element))
        .map((interface) {
      final displayName = DartTypes.getName(interface);
      if (!displayName.contains('<')) return displayName + 'Builder';
      final index = displayName.indexOf('<');
      return displayName.substring(0, index) +
          'Builder' +
          displayName.substring(index);
    })));

  @memoized
  CompilationUnitElement get compilationUnit =>
      element.library.definingCompilationUnit;

  static bool needDataClass(ClassElement classElement) {
    return classElement.metadata
        .map((annotation) => annotation.computeConstantValue())
        .any((value) => DartTypes.getName(value?.type) == 'DataClass');
  }

  Iterable<GeneratorError> computeErrors() {
    return concat([
      _checkPart(),
      _checkClass(),
      _checkFieldList(),
      _checkConstructor(),
      concat(fields.map((field) => field.computeErrors()))
    ]);
  }

  Iterable<GeneratorError> _checkPart() {
    if (hasPartStatement) return [];

    var directives = (classDeclaration.parent as CompilationUnit).directives;
    if (directives.isEmpty) {
      return [
        GeneratorError((b) => b
          ..message = 'Import generated part: $partStatement'
          ..offset = 0
          ..length = 0
          ..fix = '$partStatement\n\n')
      ];
    } else {
      return [
        GeneratorError((b) => b
          ..message = 'Import generated part: $partStatement'
          ..offset = directives.last.offset + directives.last.length
          ..length = 0
          ..fix = '\n\n$partStatement\n\n')
      ];
    }
  }

  Iterable<GeneratorError> _checkClass() {
    var result = <GeneratorError>[];

    if (dataClassIsAbstract) {
      result.add(GeneratorError((b) => b
        ..message = 'Class is abstract. Make it instantiable.'
        ..offset = classDeclaration.offset
        ..length = 0
        ..fix = 'abstract '));
    }

    if (hasDataClassImportWithShow) {
      result.add(GeneratorError((b) => b
        ..message = 'Stop using "show" when importing '
            '"package:data_class/data_class.dart". It prevents the '
            'generated code from finding helper methods.'));
    }

    if (hasDataClassImportWithAs) {
      result.add(GeneratorError((b) => b
        ..message = 'Stop using "as" when importing '
            '"package:data_class/data_class.dart". It prevents the generated '
            'code from finding helper methods.'));
    }

    return result;
  }

  Iterable<GeneratorError> _checkFieldList() {
    var nonFinalFields = fields.where((field) => !field.element.isFinal);
    return nonFinalFields.isNotEmpty
        ? [
      GeneratorError((b) => b
        ..message =
            'Data class fields must be final. However, these fields are not final: ' +
                nonFinalFields.map((field) => field.name).join(', '))
    ]
        : [];
  }

  Iterable<GeneratorError> _checkConstructor() {
    if (constructor == null) {
      return [
        GeneratorError((b) => b
          ..message = 'Default constructor is not found. '
              'Please, add ${name}() with all required parameters.')
      ];
    }

    var nonNamedParams =
    constructor.parameters.where((param) => !param.isNamed);

    if (nonNamedParams.isNotEmpty) {
      return [
        GeneratorError((b) => b
          ..message = 'Default constructor can have named parameters only. '
              'Please, make the following fields named: ${nonNamedParams.map((e) => e.name).join(', ')}.')
      ];
    }

    return <GeneratorError>[];
  }

  String get _generics =>
      genericParameters.isEmpty ? '' : '<' + genericParameters.join(', ') + '>';

  String get _boundedGenerics => genericParameters.isEmpty
      ? ''
      : '<' +
      zip(<Iterable>[genericParameters, genericBounds]).map((zipped) {
        final parameter = zipped[0] as String;
        final bound = zipped[1] as String;
        return bound.isEmpty ? parameter : '$parameter extends $bound';
      }).join(', ') +
      '>';

  String generateCode() {
    var errors = computeErrors();
    if (errors.isNotEmpty) throw _makeError(errors);

    var result = StringBuffer();
    result.write(_generateExtension());
    result.write(_generateBuilder());

    return result.toString();
  }

  /// Generates the data class extension.
  String _generateExtension() {
    var result = StringBuffer();
    result.writeln('extension ${extPartName}DataClassExtension$_generics '
        'on $name$_generics {');
    result.writeln();

    result.writeln(
        '$name$_generics rebuild(void Function($builderName builder) updates) '
            '=> (toBuilder()..update(updates)).build();');
    result.writeln();

    result.writeln('$builderName toBuilder() '
        '=> ${builderName}()..replace(this);');
    result.writeln();

    result.write(_generateEqualsAndHashcode());

    result.writeln('String get _string {');
    if (fields.isEmpty) {
      result.writeln("return newDataClassToStringHelper('$name').toString();");
    } else {
      result.writeln("return (newDataClassToStringHelper('$name')");
      result.writeln(fields
          .map(
              (field) => "..add('${escapeString(field.name)}',  ${field.name})")
          .join(''));
      result.writeln(').toString();');
    }
    result.writeln('}');
    result.writeln();

    result.writeln('}');
    return result.toString();
  }

  /// Generates the builder implementation.
  String _generateBuilder() {
    var result = StringBuffer();
    result.writeln('class ${name}Builder$_boundedGenerics '
        'implements ${builderImplements.join(", ")} {');

    // Builder holds a reference to a data class, copies from it lazily.
    result.writeln('$name$_generics _\$v;');
    result.writeln('');

    for (var field in ctorFields) {
      var type = field.typeInCompilationUnit(compilationUnit);
      var fieldType = type;
      var name = field.name;

      // Field
      result.writeln('$fieldType _$name;');

      // Getter
      result.writeln('$fieldType get $name =>');
      result.writeln('_\$this._$name;');

      // Setter
      result.writeln('set $name($fieldType $name) =>'
          '_\$this._$name = $name;');

      result.writeln();
    }
    result.writeln();

    result.writeln('${name}Builder();');
    result.writeln('');

    if (ctorFields.isNotEmpty) {
      result.writeln('$builderName get _\$this {');
      result.writeln('if (_\$v != null) {');
      for (var field in ctorFields) {
        final name = field.name;
        final nameInBuilder = '_$name';
        result.writeln('$nameInBuilder = _\$v.$name;');
      }
      result.writeln('_\$v = null;');
      result.writeln('}');
      result.writeln('return this;');
      result.writeln('}');
    }

    result.writeln('@override');
    result.writeln('void replace($name$_generics other) {');

    result.writeln('if (other == null) {');
    result.writeln("throw new ArgumentError.notNull('other');");
    result.writeln('}');
    result.writeln('_\$v = other;');
    result.writeln('}');

    result.writeln('@override');
    result.writeln('void update(void Function(${builderName} builder) updates) {'
        ' if (updates != null) updates(this); }');
    result.writeln();

    result.writeln('@override');
    result.writeln('$name$_generics build() {');

    // Construct a map from field to how it's built. If it's a normal field,
    // this is just the field name; if it's a nested builder, this is an
    // invocation of the nested builder taking into account nullability.
    var fieldBuilders = <String, String>{};
    ctorFields.forEach((field) {
      final name = field.name;
      fieldBuilders[name] = name;
    });

    result.write('final ');
    result.writeln('_\$result = _\$v ?? ');
    result.writeln('$name$_generics(');
    result.write(fieldBuilders.keys
        .map((field) => '$field: ${fieldBuilders[field]}')
        .join(','));
    result.writeln(');');

    // Set _$v to the data class, so it will be lazily copied if needed.
    result.writeln('replace(_\$result);');
    result.writeln('return _\$result;');
    result.writeln('}');

    result.writeln('}');

    return result.toString();
  }

  String _generateEqualsAndHashcode() {
    var result = StringBuffer();

    var comparedFields = fields.toList();
    var comparedFunctionFields =
    comparedFields.where((field) => field.isFunctionType).toList();
    result.writeln('bool _equals(Object other) {');
    result.writeln('  if (identical(other, this)) return true;');

    if (comparedFunctionFields.isNotEmpty) {
      result.writeln('  final dynamic _\$dynamicOther = other;');
    }
    result.writeln('  return other is $name');
    if (comparedFields.isNotEmpty) {
      result.writeln('&&');
      result.writeln(comparedFields.map((field) {
        var nameOrThisDotName =
        field.name == 'other' ? 'this.other' : field.name;
        return field.isFunctionType
            ? '$nameOrThisDotName == _\$dynamicOther.${field.name}'
            : '$nameOrThisDotName == other.${field.name}';
      }).join('&&'));
    }
    result.writeln(';');
    result.writeln('}');
    result.writeln();

    result.writeln('int get _hashCode {');

    if (comparedFields.isEmpty) {
      result.writeln('return ${name.hashCode};');
    } else {
      result.writeln('return \$jf(');
      result.writeln(r'$jc(' * comparedFields.length);
      result.writeln('0, ');
      result.write(
          comparedFields.map((field) => '${field.name}.hashCode').join('), '));
      result.writeln('));');
    }
    result.writeln('}');
    result.writeln();

    return result.toString();
  }
}

InvalidGenerationSourceError _makeError(Iterable<GeneratorError> todos) {
  var message =
  StringBuffer('Please make the following changes to use DataClass:\n');
  for (var i = 0; i != todos.length; ++i) {
    message.write('\n${i + 1}. ${todos.elementAt(i).message}');
  }

  return InvalidGenerationSourceError(message.toString());
}
