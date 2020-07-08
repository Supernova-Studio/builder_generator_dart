// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_model.dart';

// **************************************************************************
// DataClassGenerator
// **************************************************************************

extension _$InnerTestModelDataClassExtension on InnerTestModel {
  InnerTestModel rebuild(void Function(InnerTestModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  InnerTestModelBuilder toBuilder() => InnerTestModelBuilder()..replace(this);

  bool _equals(Object other) {
    if (identical(other, this)) return true;
    return other is InnerTestModel && someProperty == other.someProperty;
  }

  int get _hashCode {
    return $jf($jc(0, someProperty.hashCode));
  }

  String get _string {
    return (newDataClassToStringHelper('InnerTestModel')
          ..add('someProperty', someProperty))
        .toString();
  }
}

class InnerTestModelBuilder
    implements DataClassBuilder<InnerTestModel, InnerTestModelBuilder> {
  InnerTestModel _$v;

  String _someProperty;
  String get someProperty => _$this._someProperty;
  set someProperty(String someProperty) => _$this._someProperty = someProperty;

  InnerTestModelBuilder();

  InnerTestModelBuilder get _$this {
    if (_$v != null) {
      _someProperty = _$v.someProperty;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(InnerTestModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other;
  }

  @override
  void update(void Function(InnerTestModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  InnerTestModel build() {
    final _$result = _$v ?? InnerTestModel(someProperty: someProperty);
    replace(_$result);
    return _$result;
  }
}

extension _$TestModelDataClassExtension on TestModel {
  TestModel rebuild(void Function(TestModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  TestModelBuilder toBuilder() => TestModelBuilder()..replace(this);

  bool _equals(Object other) {
    if (identical(other, this)) return true;
    return other is TestModel &&
        name == other.name &&
        age == other.age &&
        list == other.list &&
        innerTestModel == other.innerTestModel;
  }

  int get _hashCode {
    return $jf($jc($jc($jc($jc(0, name.hashCode), age.hashCode), list.hashCode),
        innerTestModel.hashCode));
  }

  String get _string {
    return (newDataClassToStringHelper('TestModel')
          ..add('name', name)
          ..add('age', age)
          ..add('list', list)
          ..add('innerTestModel', innerTestModel))
        .toString();
  }
}

class TestModelBuilder
    implements DataClassBuilder<TestModel, TestModelBuilder> {
  TestModel _$v;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  int _age;
  int get age => _$this._age;
  set age(int age) => _$this._age = age;

  List<String> _list;
  List<String> get list => _$this._list;
  set list(List<String> list) => _$this._list = list;

  InnerTestModel _innerTestModel;
  InnerTestModel get innerTestModel => _$this._innerTestModel;
  set innerTestModel(InnerTestModel innerTestModel) =>
      _$this._innerTestModel = innerTestModel;

  TestModelBuilder();

  TestModelBuilder get _$this {
    if (_$v != null) {
      _name = _$v.name;
      _age = _$v.age;
      _list = _$v.list;
      _innerTestModel = _$v.innerTestModel;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TestModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other;
  }

  @override
  void update(void Function(TestModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  TestModel build() {
    final _$result = _$v ??
        TestModel(
            name: name, age: age, list: list, innerTestModel: innerTestModel);
    replace(_$result);
    return _$result;
  }
}

extension _$BModelDataClassExtension on BModel {
  BModel rebuild(void Function(BModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  BModelBuilder toBuilder() => BModelBuilder()..replace(this);

  bool _equals(Object other) {
    if (identical(other, this)) return true;
    return other is BModel &&
        propB1 == other.propB1 &&
        propB2 == other.propB2 &&
        propA == other.propA;
  }

  int get _hashCode {
    return $jf(
        $jc($jc($jc(0, propB1.hashCode), propB2.hashCode), propA.hashCode));
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
  BModel _$v;

  String _propB1;
  String get propB1 => _$this._propB1;
  set propB1(String propB1) => _$this._propB1 = propB1;

  String _propB2;
  String get propB2 => _$this._propB2;
  set propB2(String propB2) => _$this._propB2 = propB2;

  String _propA;
  String get propA => _$this._propA;
  set propA(String propA) => _$this._propA = propA;

  BModelBuilder();

  BModelBuilder get _$this {
    if (_$v != null) {
      _propB1 = _$v.propB1;
      _propB2 = _$v.propB2;
      _propA = _$v.propA;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other;
  }

  @override
  void update(void Function(BModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  BModel build() {
    final _$result =
        _$v ?? BModel(propB1: propB1, propB2: propB2, propA: propA);
    replace(_$result);
    return _$result;
  }
}

extension _$CModelDataClassExtension<T> on CModel<T> {
  CModel<T> rebuild(void Function(CModelBuilder<T>) updates) =>
      (toBuilder()..update(updates)).build();

  CModelBuilder<T> toBuilder() => CModelBuilder<T>()..replace(this);

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
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, genericProp.hashCode), listProp.hashCode),
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
  CModel<T> _$v;

  T _genericProp;
  T get genericProp => _$this._genericProp;
  set genericProp(T genericProp) => _$this._genericProp = genericProp;

  List<String> _listProp;
  List<String> get listProp => _$this._listProp;
  set listProp(List<String> listProp) => _$this._listProp = listProp;

  String _propB1;
  String get propB1 => _$this._propB1;
  set propB1(String propB1) => _$this._propB1 = propB1;

  String _propA;
  String get propA => _$this._propA;
  set propA(String propA) => _$this._propA = propA;

  CModelBuilder();

  CModelBuilder<T> get _$this {
    if (_$v != null) {
      _genericProp = _$v.genericProp;
      _listProp = _$v.listProp;
      _propB1 = _$v.propB1;
      _propA = _$v.propA;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CModel<T> other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other;
  }

  @override
  void update(void Function(CModelBuilder<T>) updates) {
    if (updates != null) updates(this);
  }

  @override
  CModel<T> build() {
    final _$result = _$v ??
        CModel<T>(
            genericProp: genericProp,
            listProp: listProp,
            propB1: propB1,
            propA: propA);
    replace(_$result);
    return _$result;
  }
}

extension _$TestTestDataClassExtension on TestTest {
  TestTest rebuild(void Function(TestTestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  TestTestBuilder toBuilder() => TestTestBuilder()..replace(this);

  bool _equals(Object other) {
    if (identical(other, this)) return true;
    return other is TestTest;
  }

  int get _hashCode {
    return 368418753;
  }

  String get _string {
    return newDataClassToStringHelper('TestTest').toString();
  }
}

class TestTestBuilder implements DataClassBuilder<TestTest, TestTestBuilder> {
  TestTest _$v;

  TestTestBuilder();

  @override
  void replace(TestTest other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other;
  }

  @override
  void update(void Function(TestTestBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  TestTest build() {
    final _$result = _$v ?? TestTest();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InnerTestModel _$InnerTestModelFromJson(Map<String, dynamic> json) {
  return InnerTestModel(
    someProperty: json['someProperty'] as String,
  );
}

Map<String, dynamic> _$InnerTestModelToJson(InnerTestModel instance) =>
    <String, dynamic>{
      'someProperty': instance.someProperty,
    };

TestModel _$TestModelFromJson(Map<String, dynamic> json) {
  return TestModel(
    name: json['name'] as String,
    age: json['age'] as int,
    list: (json['list'] as List)?.map((e) => e as String)?.toList(),
    innerTestModel: json['innerTestModel'] == null
        ? null
        : InnerTestModel.fromJson(
            json['innerTestModel'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$TestModelToJson(TestModel instance) => <String, dynamic>{
      'name': instance.name,
      'age': instance.age,
      'list': instance.list,
      'innerTestModel': instance.innerTestModel,
    };

CModel<T> _$CModelFromJson<T>(Map<String, dynamic> json) {
  return CModel<T>(
    propA: json['propA'] as String,
    propB1: json['propB1'] as String,
    listProp: (json['listProp'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$CModelToJson<T>(CModel<T> instance) => <String, dynamic>{
      'propA': instance.propA,
      'propB1': instance.propB1,
      'listProp': instance.listProp,
    };

TestTest _$TestTestFromJson(Map<String, dynamic> json) {
  return TestTest();
}

Map<String, dynamic> _$TestTestToJson(TestTest instance) => <String, dynamic>{};
