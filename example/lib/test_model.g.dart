// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

extension _$TestModelDataClassExtension on TestModel {
  TestModel _rebuild(void Function(DataClassBuilder<TestModel>) updates) =>
      (_toBuilder()..update(updates)).build();

  TestModelBuilder _toBuilder() => TestModelBuilder()..replace(this);

  bool _equals(Object other) {
    if (identical(other, this)) return true;
    return other is TestModel && name == other.name && age == other.age;
  }

  int get _hashCode {
    return $jf($jc($jc(0, name.hashCode), age.hashCode));
  }

  String get _string {
    return (newBuiltValueToStringHelper('TestModel')
          ..add('name', name)
          ..add('age', age))
        .toString();
  }
}

class TestModelBuilder implements DataClassBuilder<TestModel> {
  TestModel _$v;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  int _age;
  int get age => _$this._age;
  set age(int age) => _$this._age = age;

  TestModelBuilder();

  TestModelBuilder get _$this {
    if (_$v != null) {
      _name = _$v.name;
      _age = _$v.age;
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
    final _$result = _$v ?? TestModel(name: name, age: age);
    replace(_$result);
    return _$result;
  }
}

extension _$MyDCDataClassExtension on MyDC {
  MyDC _rebuild(void Function(DataClassBuilder<MyDC>) updates) =>
      (_toBuilder()..update(updates)).build();

  MyDCBuilder _toBuilder() => MyDCBuilder()..replace(this);

  bool _equals(Object other) {
    if (identical(other, this)) return true;
    return other is MyDC;
  }

  int get _hashCode {
    return 891663010;
  }

  String get _string {
    return newBuiltValueToStringHelper('MyDC').toString();
  }
}

class MyDCBuilder implements DataClassBuilder<MyDC> {
  MyDC _$v;

  MyDCBuilder();

  @override
  void replace(MyDC other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other;
  }

  @override
  void update(void Function(MyDCBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  MyDC build() {
    final _$result = _$v ?? MyDC();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TestModel _$TestModelFromJson(Map<String, dynamic> json) {
  return TestModel(
    name: json['name'] as String,
    age: json['age'] as int,
  );
}

Map<String, dynamic> _$TestModelToJson(TestModel instance) => <String, dynamic>{
      'name': instance.name,
      'age': instance.age,
    };

MyDC _$MyDCFromJson(Map<String, dynamic> json) {
  return MyDC();
}

Map<String, dynamic> _$MyDCToJson(MyDC instance) => <String, dynamic>{};
