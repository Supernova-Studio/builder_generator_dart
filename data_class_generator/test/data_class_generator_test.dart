// Copyright (c) 2015, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:async';

import 'package:build/build.dart';
import 'package:build_test/build_test.dart';
import 'package:data_class_generator/data_class_generator.dart';
import 'package:test/test.dart';
import 'package:logging/logging.dart';
import 'package:source_gen/source_gen.dart';

void main() {
  group('Output tests', () {
    test('Inner data classes has valid generated data', () async {
      expect(
        await generate('''library data_class;
import 'package:data_class/data_class.dart';
part 'value.g.dart';

@DataClass()
class InnerTestModel {
  final String someProperty;

  InnerTestModel({this.someProperty});

  @override
  InnerTestModel rebuild(Function(InnerTestModelBuilder) updates) =>
      _rebuild(updates);

  @override
  bool operator ==(other) => this._equals(other);

  @override
  String toString() => this._string;

  @override
  int get hashCode => this._hashCode;
}

@DataClass()
class TestModel {
  final String name;
  final int age;
  final InnerTestModel innerTestModel;

  TestModel({this.name, this.age, this.innerTestModel});

  @override
  TestModel rebuild(Function(TestModelBuilder) updates) => _rebuild(updates);

  @override
  bool operator ==(other) => this._equals(other);

  @override
  String toString() => this._string;

  @override
  int get hashCode => this._hashCode;
}'''),
        contains('''
extension _\$InnerTestModelDataClassExtension on InnerTestModel {
  InnerTestModel _rebuild(void Function(InnerTestModelBuilder) updates) =>
      (_toBuilder()..update(updates)).build();

  InnerTestModelBuilder _toBuilder() => InnerTestModelBuilder()..replace(this);

  bool _equals(Object other) {
    if (identical(other, this)) return true;
    return other is InnerTestModel && someProperty == other.someProperty;
  }

  int get _hashCode {
    return \$jf(\$jc(0, someProperty.hashCode));
  }

  String get _string {
    return (newDataClassToStringHelper('InnerTestModel')
          ..add('someProperty', someProperty))
        .toString();
  }
}

class InnerTestModelBuilder
    implements DataClassBuilder<InnerTestModel, InnerTestModelBuilder> {
  InnerTestModel _\$v;

  String _someProperty;
  String get someProperty => _\$this._someProperty;
  set someProperty(String someProperty) => _\$this._someProperty = someProperty;

  InnerTestModelBuilder();

  InnerTestModelBuilder get _\$this {
    if (_\$v != null) {
      _someProperty = _\$v.someProperty;
      _\$v = null;
    }
    return this;
  }

  @override
  void replace(InnerTestModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _\$v = other;
  }

  @override
  void update(void Function(InnerTestModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  InnerTestModel build() {
    final _\$result = _\$v ?? InnerTestModel(someProperty: someProperty);
    replace(_\$result);
    return _\$result;
  }
}

extension _\$TestModelDataClassExtension on TestModel {
  TestModel _rebuild(void Function(TestModelBuilder) updates) =>
      (_toBuilder()..update(updates)).build();

  TestModelBuilder _toBuilder() => TestModelBuilder()..replace(this);

  bool _equals(Object other) {
    if (identical(other, this)) return true;
    return other is TestModel &&
        name == other.name &&
        age == other.age &&
        innerTestModel == other.innerTestModel;
  }

  int get _hashCode {
    return \$jf(
        \$jc(\$jc(\$jc(0, name.hashCode), age.hashCode), innerTestModel.hashCode));
  }

  String get _string {
    return (newDataClassToStringHelper('TestModel')
          ..add('name', name)
          ..add('age', age)
          ..add('innerTestModel', innerTestModel))
        .toString();
  }
}

class TestModelBuilder
    implements DataClassBuilder<TestModel, TestModelBuilder> {
  TestModel _\$v;

  String _name;
  String get name => _\$this._name;
  set name(String name) => _\$this._name = name;

  int _age;
  int get age => _\$this._age;
  set age(int age) => _\$this._age = age;

  InnerTestModel _innerTestModel;
  InnerTestModel get innerTestModel => _\$this._innerTestModel;
  set innerTestModel(InnerTestModel innerTestModel) =>
      _\$this._innerTestModel = innerTestModel;

  TestModelBuilder();

  TestModelBuilder get _\$this {
    if (_\$v != null) {
      _name = _\$v.name;
      _age = _\$v.age;
      _innerTestModel = _\$v.innerTestModel;
      _\$v = null;
    }
    return this;
  }

  @override
  void replace(TestModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _\$v = other;
  }

  @override
  void update(void Function(TestModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  TestModel build() {
    final _\$result =
        _\$v ?? TestModel(name: name, age: age, innerTestModel: innerTestModel);
    replace(_\$result);
    return _\$result;
  }
}'''),
      );
    });

    test(
        'Complex dynamic data classes with inheritance, getters and setters has valid generated data',
        () async {
      expect(
        await generate('''library data_class;
import 'package:data_class/data_class.dart';
part 'value.g.dart';

abstract class AModel {
  final String propA;

  String get getterA;

  AModel({this.propA});
}

@DataClass()
class BModel extends AModel {
  final String propB1;
  final String propB2;

  @override
  String get getterA => 'getterA in BModel';

  BModel({this.propB1, this.propB2, String propA}) : super(propA: propA);
}

@DataClass()
class CModel<T> extends BModel {
  final T genericProp;

  final List<String> listProp;

  bool get someGetter => false;
  set someSetter(String input) => null;

  @override
  String get getterA => 'value';
  static String staticMember = 'value';

  CModel({String propA, String propB1, this.genericProp, this.listProp})
      : super(propA: propA, propB1: propB1, propB2: 'fixedValue');

  CModel<T> rebuild(void Function(CModelBuilder<T>) updates) =>
      this._rebuild(updates);

  @override
  bool operator ==(other) => this._equals(other);

  @override
  String toString() => this._string;

  @override
  int get hashCode => this._hashCode;
}'''),
        contains('''
extension _\$BModelDataClassExtension on BModel {
  BModel _rebuild(void Function(BModelBuilder) updates) =>
      (_toBuilder()..update(updates)).build();

  BModelBuilder _toBuilder() => BModelBuilder()..replace(this);

  bool _equals(Object other) {
    if (identical(other, this)) return true;
    return other is BModel &&
        propB1 == other.propB1 &&
        propB2 == other.propB2 &&
        propA == other.propA;
  }

  int get _hashCode {
    return \$jf(
        \$jc(\$jc(\$jc(0, propB1.hashCode), propB2.hashCode), propA.hashCode));
  }

  String get _string {
    return (newDataClassToStringHelper('BModel')
          ..add('propB1', propB1)
          ..add('propB2', propB2)
          ..add('propA', propA))
        .toString();
  }
}

class BModelBuilder implements DataClassBuilder<BModel, BModelBuilder> {
  BModel _\$v;

  String _propB1;
  String get propB1 => _\$this._propB1;
  set propB1(String propB1) => _\$this._propB1 = propB1;

  String _propB2;
  String get propB2 => _\$this._propB2;
  set propB2(String propB2) => _\$this._propB2 = propB2;

  String _propA;
  String get propA => _\$this._propA;
  set propA(String propA) => _\$this._propA = propA;

  BModelBuilder();

  BModelBuilder get _\$this {
    if (_\$v != null) {
      _propB1 = _\$v.propB1;
      _propB2 = _\$v.propB2;
      _propA = _\$v.propA;
      _\$v = null;
    }
    return this;
  }

  @override
  void replace(BModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _\$v = other;
  }

  @override
  void update(void Function(BModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  BModel build() {
    final _\$result =
        _\$v ?? BModel(propB1: propB1, propB2: propB2, propA: propA);
    replace(_\$result);
    return _\$result;
  }
}

extension _\$CModelDataClassExtension<T> on CModel<T> {
  CModel<T> _rebuild(void Function(CModelBuilder<T>) updates) =>
      (_toBuilder()..update(updates)).build();

  CModelBuilder<T> _toBuilder() => CModelBuilder<T>()..replace(this);

  bool _equals(Object other) {
    if (identical(other, this)) return true;
    return other is CModel &&
        genericProp == other.genericProp &&
        listProp == other.listProp &&
        propB1 == other.propB1 &&
        propB2 == other.propB2 &&
        propA == other.propA;
  }

  int get _hashCode {
    return \$jf(\$jc(
        \$jc(
            \$jc(\$jc(\$jc(0, genericProp.hashCode), listProp.hashCode),
                propB1.hashCode),
            propB2.hashCode),
        propA.hashCode));
  }

  String get _string {
    return (newDataClassToStringHelper('CModel')
          ..add('genericProp', genericProp)
          ..add('listProp', listProp)
          ..add('propB1', propB1)
          ..add('propB2', propB2)
          ..add('propA', propA))
        .toString();
  }
}

class CModelBuilder<T>
    implements DataClassBuilder<CModel<T>, CModelBuilder<T>> {
  CModel<T> _\$v;

  T _genericProp;
  T get genericProp => _\$this._genericProp;
  set genericProp(T genericProp) => _\$this._genericProp = genericProp;

  List<String> _listProp;
  List<String> get listProp => _\$this._listProp;
  set listProp(List<String> listProp) => _\$this._listProp = listProp;

  String _propB1;
  String get propB1 => _\$this._propB1;
  set propB1(String propB1) => _\$this._propB1 = propB1;

  String _propA;
  String get propA => _\$this._propA;
  set propA(String propA) => _\$this._propA = propA;

  CModelBuilder();

  CModelBuilder<T> get _\$this {
    if (_\$v != null) {
      _genericProp = _\$v.genericProp;
      _listProp = _\$v.listProp;
      _propB1 = _\$v.propB1;
      _propA = _\$v.propA;
      _\$v = null;
    }
    return this;
  }

  @override
  void replace(CModel<T> other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _\$v = other;
  }

  @override
  void update(void Function(CModelBuilder<T>) updates) {
    if (updates != null) updates(this);
  }

  @override
  CModel<T> build() {
    final _\$result = _\$v ??
        CModel<T>(
            genericProp: genericProp,
            listProp: listProp,
            propB1: propB1,
            propA: propA);
    replace(_\$result);
    return _\$result;
  }
}'''),
      );
    });
  });

  group('Valid input', () {
    test('Generator works correctly with with a single property model',
        () async {
      expect(
        await generate('''library data_class;
import 'package:data_class/data_class.dart';
part 'value.g.dart';

@DataClass()
class Value {
  final String name;
  
  Value({this.name});

  @override
  Value rebuild(Function(DataClassBuilder<Value>) updates) => _rebuild(updates);

  @override
  bool operator ==(other) => _equals(other);

  @override
  String toString() => _string;

  @override
  int get hashCode => _hashCode;
}'''),
        isNot(containsErrors),
      );
    });

    test('Generator works correctly with extending and implementing', () async {
      expect(
        await generate('''library data_class;
import 'package:data_class/data_class.dart';
part 'value.g.dart';

abstract class AModel {
  final String propA;

  AModel({this.propA});
}

abstract class BModel extends AModel {
  final String propB;

  BModel({this.propB, String propA}) : super(propA: propA);
}

abstract class IModel {
  String get someGetter;
}

@DataClass()
class CModel extends BModel implements IModel {
  final String propC;
  
  String get someGetter => "";

  CModel({String propA, String propB, this.propC})
      : super(propA: propA, propB: propB);

  @override
  CModel rebuild(void Function(CModelBuilder) updates) =>
      this._rebuild(updates);
}'''),
        isNot(containsErrors),
      );
    });

    test('Generic data class is supported', () async {
      expect(
        await generate('''library data_class;
import 'package:data_class/data_class.dart';
part 'value.g.dart';

@DataClass()
class CModel<T> {

  final T genericProp;

  CModel({this.genericProp});

  @override
  CModel<T> rebuild(void Function(CModelBuilder<T>) updates) =>
      this._rebuild(updates);
}'''),
        isNot(containsErrors),
      );
    });

    test('Ignores setters', () async {
      expect(
        await generate('''library data_class;
import 'package:data_class/data_class.dart';

part 'value.g.dart';

@DataClass()
class Value {
  set foo(int foo) => print(foo);

  Value();
}
}'''),
        isNot(containsErrors),
      );
    });

    test('Cleans generated class names for private classes', () async {
      expect(
          await generate('''library data_class;
import 'package:data_class/data_class.dart';

part 'value.g.dart';

@DataClass()
class _Value {
  _Value();
}'''),
          allOf(
            isNot(contains(r'_$_')),
            isNot(contains(r'1.')),
          ));
    });
  });

  group('Invalid input', () {
    test('Non-final fields are rejected', () async {
      expect(
        await generate('''library data_class;
import 'package:data_class/data_class.dart';
part 'value.g.dart';

mixin SomeMixin{
  int mixinProp;
}

abstract class SomeInterface {
  String interfaceProp;
}

@DataClass()
class CModel with SomeMixin implements SomeInterface {

  final String prop1;
  String prop2;

  @override
  String interfaceProp;

  CModel({this.prop1});

  @override
  CModel rebuild(void Function(CModelBuilder) updates) =>
      this._rebuild(updates);
}'''),
        contains(
            '1. Data class fields must be final. However, these fields are not final: prop2, interfaceProp, mixinProp'),
      );
    });

    test('Missing default constructor is rejected', () async {
      expect(
        await generate('''library data_class;
import 'package:data_class/data_class.dart';
part 'value.g.dart';

@DataClass()
class CModel {
  final String prop1;

  CModel.custom({this.prop1});
}'''),
        contains(
            '1. Default constructor is not found. Please, add CModel() with all required parameters.'),
      );
    });

    test('Abstract class is rejected', () async {
      expect(
        await generate('''library data_class;
import 'package:data_class/data_class.dart';
part 'value.g.dart';

@DataClass()
abstract class CModel {

  final String prop1;

  CModel({this.prop1});
}'''),
        contains('1. Class is abstract. Make it instantiable.'),
      );
    });

    test('Rejects import with _show_', () async {
      expect(
          await generate('''library data_class;
import 'package:data_class/data_class.dart' show DataClass, DataClassBuilder;
part 'value.g.dart';

@DataClass()
class Value {
  Value();
}'''),
          contains('1. Stop using "show" when importing '
              '"package:data_class/data_class.dart".'));
    });

    test('Rejects double quoted import with _show_', () async {
      expect(
          await generate('''library data_class;
import "package:data_class/data_class.dart" show DataClass, DataClassBuilder;
part 'value.g.dart';

@DataClass()
class Value {
  Value();
}'''),
          contains('1. Stop using "show" when importing '
              '"package:data_class/data_class.dart".'));
    });

    test('Rejects import with _as_', () async {
      expect(
          await generate('''library data_class;
import 'package:data_class/data_class.dart' as dc;
part 'value.g.dart';

@dc.DataClass()
class Value {
  Value();
}'''),
          contains('1. Stop using "as" when importing '
              '"package:data_class/data_class.dart".'));
    });

    test('Rejects double quoted import with _as_', () async {
      expect(
          await generate('''library data_class;
import 'package:data_class/data_class.dart' as dc;
part 'value.g.dart';

@dc.DataClass()
class Value {
  Value();
}'''),
          contains('1. Stop using "as" when importing '
              '"package:data_class/data_class.dart".'));
    });

    test('Suggests to import part file', () async {
      expect(await generate('''library data_class;
import 'package:data_class/data_class.dart';

@DataClass()
class Value {
  Value();
}
'''), contains("1. Import generated part: part 'value.g.dart';"));
    });

    test('Suggests value fields must be public', () async {
      expect(await generate('''library data_class;
import 'package:data_class/data_class.dart';

part 'value.g.dart';

@DataClass()
class Value {
  final int _foo;
  
  Value({int foo}): this._foo = foo;  
}'''), contains('1. Make field _foo public; remove the underscore.'));
    });

    test('Rejects dynamic fields', () async {
      expect(
          await generate('''library data_class;
import 'package:data_class/data_class.dart';

part 'value.g.dart';

@DataClass()
class Value {
  final dynamic foo;

  Value({this.foo});
}'''),
          contains('1. Make field foo have non-dynamic type. If you are '
              'already specifying a type, please make sure the type is correctly imported.'));
    });

//    test('Constructor with positioned parameters is rejected', () async {
//      expect(
//          await generate('''library data_class;
//import 'package:data_class/data_class.dart';
//
//part 'value.g.dart';
//
//@DataClass()
//class Value {
//  final String foo;
//
//  Value(String param1, {this.foo});
//}'''),
//          contains('1. Make field foo have non-dynamic type. If you are '
//              'already specifying a type, please make sure the type is correctly imported.'));
//    });

    test('Field without matching constructor parameter is rejected', () async {
      expect(
          await generate('''library data_class;
import 'package:data_class/data_class.dart';

part 'value.g.dart';

@DataClass()
class Value {
  final String foo;

  Value(String foo1) : this.foo = foo1;
}'''),
          contains('1. Default constructor can have named parameters only. Please, make the following fields named: foo1.'));
    });

//  test('suggests built_collection fields instead of SDK fields', () async {
//    expect(
//        await generate('''library data_class;
//
//part 'value.g.dart';
//abstract class Value implements Built<Value, ValueBuilder> {
//  Value._();
//  factory Value([void Function(ValueBuilder) updates]) = _\$Value;
//  List get list;
//  Set get set;
//  Map get map;
//}'''),
//        allOf(
//            contains('1. Make field "list" have type "BuiltList". '
//                'The current type, "List", is not allowed '
//                'because it is mutable.'),
//            contains('2. Make field "set" have type "BuiltSet". '
//                'The current type, "Set", is not allowed '
//                'because it is mutable.')));
//  });
  });

//  group('generator', () {
}

//
// Utilities
// --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---

Matcher get containsErrors => contains('1.');

//
// Test setup
// --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---

final String pkgName = 'pkg';

final Builder builder = PartBuilder([DataClassGenerator()], '.g.dart');

Future<String> generate(String source) async {
  var srcs = <String, String>{
    'data_class|lib/data_class.dart': dataClassSource,
    '$pkgName|lib/value.dart': source,
  };

  // Capture any error from generation; if there is one, return that instead of
  // the generated output.
  String error;
  void captureError(LogRecord logRecord) {
    if (logRecord.error is InvalidGenerationSourceError) {
      if (error != null) throw StateError('Expected at most one error.');
      error = logRecord.error.toString();
    }
  }

  var writer = InMemoryAssetWriter();
  await testBuilder(builder, srcs,
      rootPackage: pkgName, writer: writer, onLog: captureError);
  return error ??
      String.fromCharCodes(
          writer.assets[AssetId(pkgName, 'lib/value.g.dart')] ?? []);
}

const String dataClassSource = r'''
library data_class;

class DataClass {
  const DataClass();
}

abstract class DataClassBuilder<V, B extends DataClassBuilder<V, B>> {
  void replace(V value);
  void update(updates(DataClassBuilder<V> builder));
  V build();
''';
