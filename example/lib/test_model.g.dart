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

extension _$ChildModelDataClassExtension<T> on ChildModel<T> {
  ChildModel<T> _rebuild(void Function(ChildModelBuilder<T>) updates) =>
      (_toBuilder()..update(updates)).build();

  ChildModelBuilder<T> _toBuilder() => ChildModelBuilder<T>()..replace(this);

  bool _equals(Object other) {
    if (identical(other, this)) return true;
    return other is ChildModel &&
        genericProp == other.genericProp &&
        baseString == other.baseString;
  }

  int get _hashCode {
    return $jf($jc($jc(0, genericProp.hashCode), baseString.hashCode));
  }

  String get _string {
    return (newBuiltValueToStringHelper('ChildModel')
          ..add('genericProp', genericProp)
          ..add('baseString', baseString))
        .toString();
  }
}

class ChildModelBuilder<T>
    implements DataClassBuilder<ChildModel<T>, ChildModelBuilder<T>> {
  ChildModel<T> _$v;

  T _genericProp;
  T get genericProp => _$this._genericProp;
  set genericProp(T genericProp) => _$this._genericProp = genericProp;

  String _baseString;
  String get baseString => _$this._baseString;
  set baseString(String baseString) => _$this._baseString = baseString;

  ChildModelBuilder();

  ChildModelBuilder<T> get _$this {
    if (_$v != null) {
      _genericProp = _$v.genericProp;
      _baseString = _$v.baseString;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ChildModel<T> other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other;
  }

  @override
  void update(void Function(ChildModelBuilder<T>) updates) {
    if (updates != null) updates(this);
  }

  @override
  ChildModel<T> build() {
    final _$result =
        _$v ?? ChildModel<T>(genericProp: genericProp, baseString: baseString);
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

ChildModel<T> _$ChildModelFromJson<T>(Map<String, dynamic> json) {
  return ChildModel<T>(
    baseString: json['baseString'] as String,
  );
}

Map<String, dynamic> _$ChildModelToJson<T>(ChildModel<T> instance) =>
    <String, dynamic>{
      'baseString': instance.baseString,
    };
