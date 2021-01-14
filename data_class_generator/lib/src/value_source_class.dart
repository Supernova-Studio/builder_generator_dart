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

  @memoized
  bool get isParentDataClass =>
      element.supertype != null && needDataClass(element.supertype.element);

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

  @memoized
  BuiltList<ValueSourceField> get parentDataClassFields {
    if (!isParentDataClass) return BuiltList.of(const <ValueSourceField>[]);

    final parentElement = element.supertype.element;
    final parsedLibrary = parentElement.library.session
        .getParsedLibraryByElement(parentElement.library);

    return ValueSourceField.fromClassElements(parsedLibrary, parentElement);
  }

  /// Default constructor to be used to rebuild the data class.
  @memoized
  ConstructorElement get constructor => element.constructors
      .firstWhere((element) => element.displayName == '', orElse: () => null);

  /// Fields which are accepted by data class's constructor.
  @memoized
  BuiltList<ValueSourceField> get constructorFields {
    var paramNames = constructor.parameters.map((e) => e.name);

    return BuiltList.of(
        fields.where((field) => paramNames.contains(field.name)));
  }

  //todo comment
  @memoized
  BuiltList<ValueSourceField> get builderFields {
    //todo fix abstract classes
    // if (dataClassIsAbstract) return fields;
    return constructorFields;
  }

  /// Fields which are exposed by parent data class, but not accepted by current class's constructor.
  @memoized //todo
  BuiltList<ValueSourceField> get missingParentDataClassFields {
    if (!isParentDataClass) return BuiltList.of(const <ValueSourceField>[]);

    final parentBuilderFieldNamesSet =
        parentDataClassFields.map((field) => field.name).toSet();
    final fieldNamesSet = constructorFields.map((field) => field.name).toSet();

    final missingFieldNames =
        parentBuilderFieldNamesSet.difference(fieldNamesSet);

    return parentDataClassFields
        .where((field) => missingFieldNames.contains(field.name))
        .toBuiltList();
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

  @memoized
  String get builderPropName =>
      (name.startsWith('_') ? '_\$${name.substring(1)}' : '_\$$name') +
      '\$' +
      genericParameters.join('\$');

  static bool needDataClass(ClassElement classElement) {
    return classElement.allSupertypes
        .any((interfaceType) => interfaceType.element.name == 'DataClass');
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

    var hasDataClassInterface = element.interfaces
        .any((interface) => interface.element.name == 'DataClass');
    if (!isParentDataClass && !hasDataClassInterface) {
      result.add(GeneratorError((b) => b
        ..message =
            'Class must either implement DataClass or extend another class which implements DataClass.'));
    }
    //todo remove?
    if (isParentDataClass && !element.supertype.element.isAbstract) {
      // Parent concrete data classes add additional level of complexity which we try to avoid.
      //
      // For example, parent data class exposes some propertyA and accepts it in constructor.
      // Child data class doesn't accept it anymore and sets some default value.
      // That means we need to provide a getter and a setter for propertyA in parent builder.
      // Child builder implements parent builder, so it has to provider same getters and setters.
      // However, setter for propertyA in child builder is not valid,
      // because child data class doesn't have this property in constructor.
      result.add(GeneratorError((b) => b
        ..message =
            'Parent class is data class and non-abstract. Inheritance of abstract data classes only is allowed.'));
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
    // Abstract classes can have named constructors and non-named params
    // since we won't rebuild them and their builders are abstract as well.
    if (!dataClassIsAbstract) {
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
    if (!dataClassIsAbstract) {
      result.write(_generateExtension());
    }
    result.write(_generateBuilder());

    return result.toString();
  }

  /// Generates the data class extension.
  String _generateExtension() {
    var result = StringBuffer();
    result.writeln('extension ${name}DataClassExtension$_generics '
        'on $name$_generics {');
    result.writeln();

    result.writeln(
        '$name$_generics _rebuild(void Function($builderName builder) updates) '
        '=> (_toBuilder()..update(updates)).build();');
    result.writeln();

    result.writeln('$builderName _toBuilder() '
        '=> ${builderName}._().._replace(this);');
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
    if (dataClassIsAbstract) result.writeln('abstract ');
    result.write('class ${name}Builder$_boundedGenerics ');

    if (isParentDataClass) {
      result.write('implements ${element.supertype.element.name}Builder');
    } else {
      result.write('implements ${builderImplements.join(", ")}');
    }
    result.writeln('{');

    // Builder holds a reference to a data class, copies from it lazily.
    if (!dataClassIsAbstract) {
      result.writeln('$name$_generics $builderPropName;');
      result.writeln('');
    }

    for (var field in builderFields) {
      var type = field.typeInCompilationUnit(compilationUnit);
      var typeInBuilder = field.typeInBuilder(compilationUnit);
      var fieldType = field.isNestedBuilder ? typeInBuilder : type;
      var name = field.name;

      // Field
      if (!dataClassIsAbstract) result.writeln('$fieldType _$name;');

      // Getter
      result.write('$fieldType get $name');
      if (dataClassIsAbstract) {
        result.write(';');
      } else {
        result.write(' => _\$this._$name;');
      }
      result.writeln();

      // Setter
      if (field.settings.createBuilderSetter) {
        result.write('set $name($fieldType $name)');
        if (dataClassIsAbstract) {
          result.write(';');
        } else {
          result.write(' => _\$this._$name = $name;');
        }
      }

      result.writeln();
    }
    result.writeln();

    //todo add checks to avoid setters without ctor params

    //todo remove and join with the for cycle above
    // Fields from parent classes which are not accepted by current data class's constructor.
    // These fields can be only read.
    if (!dataClassIsAbstract) {
      for (var field in missingParentDataClassFields) {
        var type = field.typeInCompilationUnit(compilationUnit);
        var typeInBuilder = field.typeInBuilder(compilationUnit);
        var fieldType = field.isNestedBuilder ? typeInBuilder : type;
        var name = field.name;

        // Field
        result.writeln('$fieldType _$name;');

        // Getter
        result.writeln('$fieldType get $name => _\$this._$name;');
      }

      result.writeln();
    }

    // Constructor
    if (!dataClassIsAbstract) {
      result.writeln('${name}Builder._();');
      result.writeln('');
    }

    if (!dataClassIsAbstract) {
      result.writeln(_generateBuilderThisProp());
      result.writeln(_generateBuilderReplace());
      result.writeln(_generateBuilderUpdate());
    }
    result.writeln(_generateBuilderBuild());

    result.writeln('}');

    return result.toString();
  }

  String _generateBuilderBuild() {
    var result = StringBuffer();

    result.writeln('@override');
    result.write('$name$_generics build()');
    if (dataClassIsAbstract) {
      result.writeln(';');
    } else {
      result.writeln(' {');

      // Construct a map from field to how it's built. If it's a normal field,
      // this is just the field name; if it's a nested builder, this is an
      // invocation of the nested builder taking into account nullability.
      var fieldBuilders = <String, String>{};

      for (var field in constructorFields) {
        final name = field.name;
        if (!field.isNestedBuilder) {
          fieldBuilders[name] = name;
        } else {
          fieldBuilders[name] = '_$name?.build()';
        }
      }

      result.write('final ');
      result.writeln('_\$result = $builderPropName ?? ');
      result.writeln('$name$_generics(');
      result.write(fieldBuilders.keys
          .map((field) => '$field: ${fieldBuilders[field]}')
          .join(','));
      result.writeln(');');

      // Set inner prop to the data class, so it will be lazily copied if needed.
      result.writeln('_replace(_\$result);');
      result.writeln('return _\$result;');
      result.writeln('}');
    }

    return result.toString();
  }

  String _generateBuilderUpdate() {
    var result = StringBuffer();

    result.writeln('@override');
    result
        .writeln('void update(void Function(${builderName} builder) updates) {'
            ' if (updates != null) updates(this); }');
    result.writeln();

    return result.toString();
  }

  String _generateBuilderReplace() {
    var result = StringBuffer();

    result.writeln('void _replace(covariant $name$_generics other) {');

    result.writeln('if (other == null) {');
    result.writeln("throw new ArgumentError.notNull('other');");
    result.writeln('}');
    result.writeln('$builderPropName = other;');
    result.writeln('}');

    return result.toString();
  }

  String _generateBuilderThisProp() {
    var result = StringBuffer();

    //todo use single list, fix redundant if
    if (constructorFields.isNotEmpty) {
      result.writeln('$builderName get _\$this {');
      result.writeln('if ($builderPropName != null) {');
      for (var field
          in constructorFields.followedBy(missingParentDataClassFields)) {
        final name = field.name;
        final nameInBuilder = '_$name';
        if (field.isNestedBuilder) {
          result
              .writeln('$nameInBuilder = $builderPropName.$name?.toBuilder();');
        } else {
          result.writeln('$nameInBuilder = $builderPropName.$name;');
        }
      }
      result.writeln('$builderPropName = null;');
      result.writeln('}');
      result.writeln('return this;');
      result.writeln('}');
    }

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
