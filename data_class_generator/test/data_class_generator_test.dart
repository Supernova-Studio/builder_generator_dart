// Copyright (c) 2015, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:async';

import 'package:build/build.dart';
import 'package:build_test/build_test.dart';
import 'package:data_class_generator/data_class_generator.dart';
import 'package:logging/logging.dart';
import 'package:source_gen/source_gen.dart';
import 'package:test/test.dart';

void main() {
  group('Output tests', () {
    test('Referenced data classes has valid generated data', () async {
      expect(
        await generate('''library data_class;
import 'package:data_class/data_class.dart';
part 'value.g.dart';

class InnerTestModel implements DataClass<InnerTestModel, InnerTestModelBuilder> {
  final String someProperty;

  InnerTestModel({this.someProperty});

  @override
  bool operator ==(other) => this._equals(other);

  @override
  String toString() => this._string;

  @override
  int get hashCode => this._hashCode;

  @override
  InnerTestModel rebuild(void Function(InnerTestModelBuilder) updates) => _rebuild(updates);

  @override
  InnerTestModelBuilder toBuilder() => _toBuilder();
}

class TestModel implements DataClass<TestModel, TestModelBuilder> {
  final String name;
  final int age;
  final InnerTestModel innerTestModel;

  TestModel({this.name, this.age, this.innerTestModel});

  @override
  bool operator ==(other) => this._equals(other);

  @override
  String toString() => this._string;

  @override
  int get hashCode => this._hashCode;

  @override
  TestModel rebuild(void Function(TestModelBuilder) updates) => _rebuild(updates);

  @override
  TestModelBuilder toBuilder() => _toBuilder();
}'''),
        contains('''
extension InnerTestModelDataClassExtension on InnerTestModel {
  InnerTestModel _rebuild(
          void Function(InnerTestModelBuilder builder) updates) =>
      (_toBuilder()..update(updates)).build();

  InnerTestModelBuilder _toBuilder() => InnerTestModelBuilder().._replace(this);

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
  InnerTestModel _\$InnerTestModel\$;

  String _someProperty;
  String get someProperty => _\$this._someProperty;
  set someProperty(String someProperty) => _\$this._someProperty = someProperty;

  InnerTestModelBuilder();

  InnerTestModelBuilder get _\$this {
    if (_\$InnerTestModel\$ != null) {
      _someProperty = _\$InnerTestModel\$.someProperty;
      _\$InnerTestModel\$ = null;
    }
    return this;
  }

  void _replace(covariant InnerTestModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _\$InnerTestModel\$ = other;
  }

  @override
  void update(void Function(InnerTestModelBuilder builder) updates) {
    if (updates != null) updates(this);
  }

  @override
  InnerTestModel build() {
    final _\$result =
        _\$InnerTestModel\$ ?? InnerTestModel(someProperty: someProperty);
    _replace(_\$result);
    return _\$result;
  }
}

extension TestModelDataClassExtension on TestModel {
  TestModel _rebuild(void Function(TestModelBuilder builder) updates) =>
      (_toBuilder()..update(updates)).build();

  TestModelBuilder _toBuilder() => TestModelBuilder().._replace(this);

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
  TestModel _\$TestModel\$;

  String _name;
  String get name => _\$this._name;
  set name(String name) => _\$this._name = name;
  int _age;
  int get age => _\$this._age;
  set age(int age) => _\$this._age = age;
  InnerTestModelBuilder _innerTestModel;
  InnerTestModelBuilder get innerTestModel =>
      _\$this._innerTestModel ??= new InnerTestModelBuilder();
  set innerTestModel(InnerTestModelBuilder innerTestModel) =>
      _\$this._innerTestModel = innerTestModel;

  TestModelBuilder();

  TestModelBuilder get _\$this {
    if (_\$TestModel\$ != null) {
      _name = _\$TestModel\$.name;
      _age = _\$TestModel\$.age;
      _innerTestModel = _\$TestModel\$.innerTestModel?.toBuilder();
      _\$TestModel\$ = null;
    }
    return this;
  }

  void _replace(covariant TestModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _\$TestModel\$ = other;
  }

  @override
  void update(void Function(TestModelBuilder builder) updates) {
    if (updates != null) updates(this);
  }

  @override
  TestModel build() {
    final _\$result = _\$TestModel\$ ??
        TestModel(
            name: name, age: age, innerTestModel: _innerTestModel?.build());
    _replace(_\$result);
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

abstract class AModel implements DataClass<AModel, AModelBuilder> {
  final String propA;

  String get getterA;

  AModel({this.propA});
}

class BModel extends AModel {
  final String propB1;
  final String propB2;

  @override
  String get getterA => 'getterA in BModel';

  BModel({this.propB1, this.propB2, String propA}) : super(propA: propA);

  @override
  BModel rebuild(void Function(BModelBuilder) updates) =>
      _rebuild(updates);

  @override
  BModelBuilder toBuilder() => _toBuilder();
}

class CModel<T> extends BModel {
  final T genericProp;

  bool get someGetter => false;

  set someSetter(String input) => null;

  @override
  String get getterA => 'value';
  static String staticMember = 'value';

  CModel({String propA, String propB1, this.genericProp})
      : super(propA: propA, propB1: propB1, propB2: 'fixedValue');

  @override
  bool operator ==(other) => _equals(other);

  @override
  String toString() => _string;

  @override
  int get hashCode => _hashCode;

  @override
  CModel<T> rebuild(void Function(CModelBuilder<T>) updates) =>
      _rebuild(updates);

  @override
  CModelBuilder<T> toBuilder() => _toBuilder();
}'''),
        contains('''
abstract class AModelBuilder
    implements DataClassBuilder<AModel, AModelBuilder> {
  String get propA;
  set propA(String propA);

  AModelBuilder();

  @override
  AModel build();
}

extension BModelDataClassExtension on BModel {
  BModel _rebuild(void Function(BModelBuilder builder) updates) =>
      (_toBuilder()..update(updates)).build();

  BModelBuilder _toBuilder() => BModelBuilder().._replace(this);

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

class BModelBuilder extends AModelBuilder {
  BModel _\$BModel\$;

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
    if (_\$BModel\$ != null) {
      _propB1 = _\$BModel\$.propB1;
      _propB2 = _\$BModel\$.propB2;
      _propA = _\$BModel\$.propA;
      _\$BModel\$ = null;
    }
    return this;
  }

  void _replace(covariant BModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _\$BModel\$ = other;
  }

  @override
  void update(void Function(BModelBuilder builder) updates) {
    if (updates != null) updates(this);
  }

  @override
  BModel build() {
    final _\$result =
        _\$BModel\$ ?? BModel(propB1: propB1, propB2: propB2, propA: propA);
    _replace(_\$result);
    return _\$result;
  }
}

extension CModelDataClassExtension<T> on CModel<T> {
  CModel<T> _rebuild(void Function(CModelBuilder<T> builder) updates) =>
      (_toBuilder()..update(updates)).build();

  CModelBuilder<T> _toBuilder() => CModelBuilder<T>().._replace(this);

  bool _equals(Object other) {
    if (identical(other, this)) return true;
    return other is CModel &&
        genericProp == other.genericProp &&
        propB1 == other.propB1 &&
        propB2 == other.propB2 &&
        propA == other.propA;
  }

  int get _hashCode {
    return \$jf(\$jc(
        \$jc(\$jc(\$jc(0, genericProp.hashCode), propB1.hashCode),
            propB2.hashCode),
        propA.hashCode));
  }

  String get _string {
    return (newDataClassToStringHelper('CModel')
          ..add('genericProp', genericProp)
          ..add('propB1', propB1)
          ..add('propB2', propB2)
          ..add('propA', propA))
        .toString();
  }
}

class CModelBuilder<T> extends BModelBuilder {
  CModel<T> _\$CModel\$T;

  T _genericProp;
  T get genericProp => _\$this._genericProp;
  set genericProp(T genericProp) => _\$this._genericProp = genericProp;
  String _propB1;
  String get propB1 => _\$this._propB1;
  set propB1(String propB1) => _\$this._propB1 = propB1;
  String _propA;
  String get propA => _\$this._propA;
  set propA(String propA) => _\$this._propA = propA;

  CModelBuilder();

  CModelBuilder<T> get _\$this {
    if (_\$CModel\$T != null) {
      _genericProp = _\$CModel\$T.genericProp;
      _propB1 = _\$CModel\$T.propB1;
      _propA = _\$CModel\$T.propA;
      _\$CModel\$T = null;
    }
    return this;
  }

  void _replace(covariant CModel<T> other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _\$CModel\$T = other;
  }

  @override
  void update(void Function(CModelBuilder<T> builder) updates) {
    if (updates != null) updates(this);
  }

  @override
  CModel<T> build() {
    final _\$result = _\$CModel\$T ??
        CModel<T>(genericProp: genericProp, propB1: propB1, propA: propA);
    _replace(_\$result);
    return _\$result;
  }
}'''),
      );
    });

    test('Nested builders are supported', () async {
      expect(await generate('''library data_class;
import 'package:data_class/data_class.dart';

part 'value.g.dart';

class NodeDataClass implements DataClass<NodeDataClass, NodeDataClassBuilder> {
  final String label;
  final NodeDataClass left;
  final NodeDataClass right;

  NodeDataClass({this.label, this.left, this.right});

  @override
  NodeDataClass rebuild(void Function(NodeDataClassBuilder) updates) => _rebuild(updates);

  @override
  NodeDataClassBuilder toBuilder() => _toBuilder();
}'''), contains('''
extension NodeDataClassDataClassExtension on NodeDataClass {
  NodeDataClass _rebuild(void Function(NodeDataClassBuilder builder) updates) =>
      (_toBuilder()..update(updates)).build();

  NodeDataClassBuilder _toBuilder() => NodeDataClassBuilder().._replace(this);

  bool _equals(Object other) {
    if (identical(other, this)) return true;
    return other is NodeDataClass &&
        label == other.label &&
        left == other.left &&
        right == other.right;
  }

  int get _hashCode {
    return \$jf(\$jc(\$jc(\$jc(0, label.hashCode), left.hashCode), right.hashCode));
  }

  String get _string {
    return (newDataClassToStringHelper('NodeDataClass')
          ..add('label', label)
          ..add('left', left)
          ..add('right', right))
        .toString();
  }
}

class NodeDataClassBuilder
    implements DataClassBuilder<NodeDataClass, NodeDataClassBuilder> {
  NodeDataClass _\$NodeDataClass\$;

  String _label;
  String get label => _\$this._label;
  set label(String label) => _\$this._label = label;
  NodeDataClassBuilder _left;
  NodeDataClassBuilder get left => _\$this._left ??= new NodeDataClassBuilder();
  set left(NodeDataClassBuilder left) => _\$this._left = left;
  NodeDataClassBuilder _right;
  NodeDataClassBuilder get right =>
      _\$this._right ??= new NodeDataClassBuilder();
  set right(NodeDataClassBuilder right) => _\$this._right = right;

  NodeDataClassBuilder();

  NodeDataClassBuilder get _\$this {
    if (_\$NodeDataClass\$ != null) {
      _label = _\$NodeDataClass\$.label;
      _left = _\$NodeDataClass\$.left?.toBuilder();
      _right = _\$NodeDataClass\$.right?.toBuilder();
      _\$NodeDataClass\$ = null;
    }
    return this;
  }

  void _replace(covariant NodeDataClass other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _\$NodeDataClass\$ = other;
  }

  @override
  void update(void Function(NodeDataClassBuilder builder) updates) {
    if (updates != null) updates(this);
  }

  @override
  NodeDataClass build() {
    final _\$result = _\$NodeDataClass\$ ??
        NodeDataClass(
            label: label, left: _left?.build(), right: _right?.build());
    _replace(_\$result);
    return _\$result;
  }
}'''));
    });
  });

  group('Valid input', () {
    test('Generator works correctly with with a single property model',
        () async {
      expect(
        await generate('''library data_class;
import 'package:data_class/data_class.dart';
part 'value.g.dart';

class Value implements DataClass<Value, ValueBuilder> {
  final String name;
  
  Value({this.name});

  @override
  bool operator ==(other) => _equals(other);

  @override
  String toString() => _string;

  @override
  int get hashCode => _hashCode;
  
  @override
  Value rebuild(void Function(ValueBuilder) updates) => _rebuild(updates);

  @override
  ValueBuilder toBuilder() => _toBuilder();
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

class CModel extends BModel implements DataClass<CModel, CModelBuilder> {
  final String propC;
  
  String get someGetter => "";

  CModel({String propA, String propB, this.propC})
      : super(propA: propA, propB: propB);

  @override
  CModel rebuild(void Function(CModelBuilder) updates) => _rebuild(updates);

  @override
  CModelBuilder toBuilder() => _toBuilder();      
}'''),
        isNot(containsErrors),
      );
    });

    test('Generic data class is supported', () async {
      expect(
        await generate('''library data_class;
import 'package:data_class/data_class.dart';
part 'value.g.dart';

class Value<T> implements DataClass<Value<T>, ValueBuilder<T>> {

  final T genericProp;

  Value({this.genericProp});
    
  @override
  Value rebuild(void Function(ValueBuilder) updates) => _rebuild(updates);

  @override
  ValueBuilder toBuilder() => _toBuilder();
}'''),
        isNot(containsErrors),
      );
    });

    test('Ignores setters', () async {
      expect(
        await generate('''library data_class;
import 'package:data_class/data_class.dart';

part 'value.g.dart';

class Value implements DataClass<Value, ValueBuilder> {
  set foo(int foo) => print(foo);

  Value();
    
  @override
  Value rebuild(void Function(ValueBuilder) updates) => _rebuild(updates);

  @override
  ValueBuilder toBuilder() => _toBuilder();  
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

class _Value implements DataClass<_Value, _ValueBuilder> {
  _Value();

  @override
  _Value rebuild(void Function(_ValueBuilder) updates) => _rebuild(updates);

  @override
  _ValueBuilder toBuilder() => _toBuilder();  
}'''),
          allOf(
            isNot(contains(r'_$_')),
            isNot(contains(r'1.')),
          ));
    });

    test('Private generic data classes are supported', () async {
      expect(
        await generate('''library data_class;
import 'package:data_class/data_class.dart';

part 'value.g.dart';

class _Value<T, S> implements DataClass<_Value<T, S>, _ValueBuilder<T, S>> {
  final String prop;

  _Value({this.prop});

  @override
  _Value<T, S> rebuild(void Function(_ValueBuilder<T, S>) updates) => _rebuild(updates);

  @override
  _ValueBuilder<T, S> toBuilder() => _toBuilder();  
}'''),
        isNot(containsErrors),
      );
    });

    test('Data class field: ignoreForBuilder is supported', () async {
      expect(
        await generate('''library data_class;
import 'package:data_class/data_class.dart';

part 'value.g.dart';

class Value implements DataClass<Value, ValueBuilder> {
  final String str;
  
  @DataClassField(ignoreForBuilder: true)
  final String ignoredStr;

  const Value({this.str, this.ignoredStr});

  @override
  Value rebuild(void Function(ValueBuilder builder) updates) => 
      _rebuild(updates);

  @override
  ValueBuilder toBuilder() => _toBuilder();
}'''),
        allOf(
          contains(r'_str'),
          isNot(contains(r'_ignoredStr')),
          isNot(contains(r'1.')),
        ),
      );
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

class Value with SomeMixin implements SomeInterface, DataClass<Value, ValueBuilder> {

  final String prop1;
  String prop2;

  @override
  String interfaceProp;

  Value({this.prop1});

  @override
  Value rebuild(void Function(ValueBuilder) updates) => _rebuild(updates);

  @override
  ValueBuilder toBuilder() => _toBuilder();    
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

class Value implements DataClass<Value, ValueBuilder> {
  final String prop1;

  Value.custom({this.prop1});
      
  @override
  Value rebuild(void Function(ValueBuilder) updates) => _rebuild(updates);

  @override
  ValueBuilder toBuilder() => _toBuilder();  
}'''),
        contains(
            '1. Default constructor is not found. Please, add Value() with all required parameters.'),
      );
    });

    test('Rejects import with _show_', () async {
      expect(
          await generate('''library data_class;
import 'package:data_class/data_class.dart' show DataClass, DataClassBuilder;
part 'value.g.dart';

class Value implements DataClass<Value, ValueBuilder> {
  Value();
        
  @override
  Value rebuild(void Function(ValueBuilder) updates) => _rebuild(updates);

  @override
  ValueBuilder toBuilder() => _toBuilder();
}'''),
          contains('1. Stop using "show" when importing '
              '"package:data_class/data_class.dart".'));
    });

    test('Rejects double quoted import with _show_', () async {
      expect(
          await generate('''library data_class;
import "package:data_class/data_class.dart" show DataClass, DataClassBuilder;
part 'value.g.dart';

class Value implements DataClass<Value, ValueBuilder> {
  Value();
        
  @override
  Value rebuild(void Function(ValueBuilder) updates) => _rebuild(updates);

  @override
  ValueBuilder toBuilder() => _toBuilder();
}'''),
          contains('1. Stop using "show" when importing '
              '"package:data_class/data_class.dart".'));
    });

    test('Rejects import with _as_', () async {
      expect(
          await generate('''library data_class;
import 'package:data_class/data_class.dart' as dc;
part 'value.g.dart';

class Value implements dc.DataClass<Value, ValueBuilder> {
  Value();

  @override
  Value rebuild(void Function(ValueBuilder) updates) => _rebuild(updates);

  @override
  ValueBuilder toBuilder() => _toBuilder();  
}'''),
          contains('1. Stop using "as" when importing '
              '"package:data_class/data_class.dart".'));
    });

    test('Rejects double quoted import with _as_', () async {
      expect(
          await generate('''library data_class;
import 'package:data_class/data_class.dart' as dc;
part 'value.g.dart';

class Value implements dc.DataClass<Value, ValueBuilder> {
  Value();

  @override
  Value rebuild(void Function(ValueBuilder) updates) => _rebuild(updates);

  @override
  ValueBuilder toBuilder() => _toBuilder();  
}'''),
          contains('1. Stop using "as" when importing '
              '"package:data_class/data_class.dart".'));
    });

    test('Suggests to import part file', () async {
      expect(await generate('''library data_class;
import 'package:data_class/data_class.dart';

class Value implements DataClass<Value, ValueBuilder> {
  Value();
  
  @override
  Value rebuild(void Function(ValueBuilder) updates) => _rebuild(updates);

  @override
  ValueBuilder toBuilder() => _toBuilder();
}
'''), contains("1. Import generated part: part 'value.g.dart';"));
    });

    test('Suggests value fields must be public', () async {
      expect(await generate('''library data_class;
import 'package:data_class/data_class.dart';

part 'value.g.dart';

class Value implements DataClass<Value, ValueBuilder> {
  final int _foo;
  
  Value({int foo}): this._foo = foo;
    
  @override
  Value rebuild(void Function(ValueBuilder) updates) => _rebuild(updates);

  @override
  ValueBuilder toBuilder() => _toBuilder();
}'''), contains('1. Make field _foo public; remove the underscore.'));
    });

    test('Rejects dynamic fields', () async {
      expect(
          await generate('''library data_class;
import 'package:data_class/data_class.dart';

part 'value.g.dart';

class Value implements DataClass<Value, ValueBuilder> {
  final dynamic foo;

  Value({this.foo});
    
  @override
  Value rebuild(void Function(ValueBuilder) updates) => _rebuild(updates);

  @override
  ValueBuilder toBuilder() => _toBuilder();
}'''),
          contains('1. Make field foo have non-dynamic type. If you are '
              'already specifying a type, please make sure the type is correctly imported.'));
    });

    test('Constructor with positioned parameters is rejected', () async {
      expect(
          await generate('''library data_class;
import 'package:data_class/data_class.dart';

part 'value.g.dart';

class Value implements DataClass<Value, ValueBuilder> {
  final String foo;

  Value(String param1, {this.foo});
    
  @override
  Value rebuild(void Function(ValueBuilder) updates) => _rebuild(updates);

  @override
  ValueBuilder toBuilder() => _toBuilder();
}'''),
          contains('1. Default constructor can have named parameters only. '
              'Please, make the following fields named: param1.'));
    });

    test('Constructor with optional parameters is rejected', () async {
      expect(
          await generate('''library data_class;
import 'package:data_class/data_class.dart';

part 'value.g.dart';

class Value implements DataClass<Value, ValueBuilder> {
  final String foo;

  Value([this.foo = "123"]]);
  
  @override
  Value rebuild(void Function(ValueBuilder) updates) => _rebuild(updates);

  @override
  ValueBuilder toBuilder() => _toBuilder();
}'''),
          contains('1. Default constructor can have named parameters only. '
              'Please, make the following fields named: foo.'));
    });

    test('Field without matching constructor parameter is rejected', () async {
      expect(
          await generate('''library data_class;
import 'package:data_class/data_class.dart';

part 'value.g.dart';

class Value implements DataClass<Value, ValueBuilder> {
  final String foo;

  Value(String foo1) : this.foo = foo1;
  
  @override
  Value rebuild(void Function(ValueBuilder) updates) => _rebuild(updates);

  @override
  ValueBuilder toBuilder() => _toBuilder();
}'''),
          contains(
              '1. Default constructor can have named parameters only. Please, make the following fields named: foo1.'));
    });

    test('Suggests built_collection fields instead of SDK fields', () async {
      expect(
          await generate('''library data_class;
import 'package:data_class/data_class.dart';
part 'value.g.dart';

class Value implements DataClass<Value, ValueBuilder> {
  final List list;
  final Set set;
  final Map map;
  
  final List<String> listTyped;
  final Set<int> setTyped;
  final Map<String, dynamic> mapTyped;
  
  Value({this.list, this.set, this.map, this.listTyped, this.setTyped, this.mapTyped});
    
  @override
  Value rebuild(void Function(ValueBuilder) updates) => _rebuild(updates);

  @override
  ValueBuilder toBuilder() => _toBuilder();
}'''),
          allOf(
            contains('1. Make field "list" have type "BuiltList". '
                'The current type, "List", is not allowed '
                'because it is mutable.'),
            contains('2. Make field "set" have type "BuiltSet". '
                'The current type, "Set", is not allowed '
                'because it is mutable.'),
            contains('3. Make field "map" have type "BuiltMap". '
                'The current type, "Map", is not allowed '
                'because it is mutable.'),
            contains('4. Make field "listTyped" have type "BuiltList". '
                'The current type, "List", is not allowed '
                'because it is mutable.'),
            contains('5. Make field "setTyped" have type "BuiltSet". '
                'The current type, "Set", is not allowed '
                'because it is mutable.'),
            contains('6. Make field "mapTyped" have type "BuiltMap". '
                'The current type, "Map", is not allowed '
                'because it is mutable.'),
          ));
    });

    test('Extending data class is rejected', () async {
      expect(
        await generate('''library data_class;
import 'package:data_class/data_class.dart';
part 'value.g.dart';

class Value extends DataClass<Value, ValueBuilder> {
  final String prop;
  
  Value({this.prop});
    
  @override
  Value rebuild(void Function(ValueBuilder) updates) => _rebuild(updates);

  @override
  ValueBuilder toBuilder() => _toBuilder();
}'''),
        contains(
            '1. Class must either implement DataClass or extend another class which implements DataClass.'),
      );
    });
  });
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

abstract class DataClass<V extends DataClass<V, B>, B extends DataClassBuilder<V, B>> {
  DataClass._();
  V rebuild(void Function(B builder) updates);
  B toBuilder();
}

class DataClassField {
  final bool ignoreForBuilder;

  const DataClassField({this.ignoreForBuilder = false});
}

abstract class DataClassBuilder<V, B extends DataClassBuilder<V, B>> {
  void update(Function(B builder) updates);
  V build();
}
''';
