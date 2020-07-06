// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_model.dart';

// **************************************************************************
// DataClassGenerator
// **************************************************************************

extension _$InnerTestModelDataClassExtension on InnerTestModel {
  InnerTestModel _rebuild(void Function(InnerTestModelBuilder) updates) =>
      (_toBuilder()..update(updates)).build();

  InnerTestModelBuilder _toBuilder() => InnerTestModelBuilder()..replace(this);

  bool _equals(Object other) {
    if (identical(other, this)) return true;
    return other is InnerTestModel && someProperty == other.someProperty;
  }

  int get _hashCode {
    return $jf($jc(0, someProperty.hashCode));
  }

  String get _string {
    return (newBuiltValueToStringHelper('InnerTestModel')
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
  TestModel _rebuild(void Function(TestModelBuilder) updates) =>
      (_toBuilder()..update(updates)).build();

  TestModelBuilder _toBuilder() => TestModelBuilder()..replace(this);

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
    return (newBuiltValueToStringHelper('TestModel')
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

extension _$CModelDataClassExtension<T> on CModel<T> {
  CModel<T> _rebuild(void Function(CModelBuilder<T>) updates) =>
      (_toBuilder()..update(updates)).build();

  CModelBuilder<T> _toBuilder() => CModelBuilder<T>()..replace(this);

  bool _equals(Object other) {
    if (identical(other, this)) return true;
    return other is CModel &&
        genericProp == other.genericProp &&
        propB1 == other.propB1 &&
        propB2 == other.propB2 &&
        propA == other.propA;
  }

  int get _hashCode {
    return $jf($jc(
        $jc($jc($jc(0, genericProp.hashCode), propB1.hashCode),
            propB2.hashCode),
        propA.hashCode));
  }

  String get _string {
    return (newBuiltValueToStringHelper('CModel')
          ..add('genericProp', genericProp)
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
        CModel<T>(genericProp: genericProp, propB1: propB1, propA: propA);
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
  );
}

Map<String, dynamic> _$CModelToJson<T>(CModel<T> instance) => <String, dynamic>{
      'propA': instance.propA,
      'propB1': instance.propB1,
    };
