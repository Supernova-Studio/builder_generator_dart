// GENERATED CODE - DO NOT MODIFY BY HAND
part of 'test_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

extension BuiltTestModelExtension on TestModel {
  TestModel _rebuild(void Function(TestModelBuilder) updates) =>
      (_toBuilder()..update(updates)).build();

  TestModelBuilder _toBuilder() => new TestModelBuilder()..replace(this);

  bool _equals(Object other) {
    if (identical(other, this)) return true;
    return other is TestModel && this.name == other.name;
  }

  int get _hashCode {
    return $jf($jc(0, this.name.hashCode));
  }

  String get _string {
    return (newBuiltValueToStringHelper('TestModel')..add('name', name))
        .toString();
  }
}

//TestModel _$TestModelFromBuilder([void Function(TestModelBuilder) updates]) =>
//    (TestModelBuilder()..update(updates)).build();

class TestModelBuilder implements Builder<TestModel, TestModelBuilder> {
  TestModel _$v;

  String _name;

  String get name => _$this._name;

  set name(String name) => _$this._name = name;

  TestModelBuilder();

  TestModelBuilder get _$this {
    if (_$v != null) {
      _name = _$v.name;
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
    final _$result = _$v ?? new TestModel(name: name);
    replace(_$result);
    return _$result;
  }
}
