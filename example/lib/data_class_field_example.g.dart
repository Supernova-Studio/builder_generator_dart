// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_class_field_example.dart';

// **************************************************************************
// DataClassGenerator
// **************************************************************************

extension ValueDataClassExtension on Value {
  Value _rebuild(void Function(ValueBuilder builder) updates) =>
      (_toBuilder()..update(updates)).build();

  ValueBuilder _toBuilder() => ValueBuilder._().._replace(this);

  bool _equals(Object other) {
    if (identical(other, this)) return true;
    return other is Value &&
        prop1 == other.prop1 &&
        prop2 == other.prop2 &&
        prop3 == other.prop3;
  }

  int get _hashCode {
    return $jf(
        $jc($jc($jc(0, prop1.hashCode), prop2.hashCode), prop3.hashCode));
  }

  String get _string {
    return (newDataClassToStringHelper('Value')
          ..add('prop1', prop1)
          ..add('prop2', prop2)
          ..add('prop3', prop3))
        .toString();
  }
}

class ValueBuilder implements DataClassBuilder<Value, ValueBuilder> {
  Value _$Value$;

  String _prop1;
  String get prop1 => _$this._prop1;
  set prop1(String prop1) => _$this._prop1 = prop1;
  String _prop2;
  String get prop2 => _$this._prop2;
  set prop2(String prop2) => _$this._prop2 = prop2;
  String _prop3;
  String get prop3 => _$this._prop3;
  set prop3(String prop3) => _$this._prop3 = prop3;

  ValueBuilder._();

  ValueBuilder get _$this {
    if (_$Value$ != null) {
      _prop1 = _$Value$.prop1;
      _prop2 = _$Value$.prop2;
      _prop3 = _$Value$.prop3;
      _$Value$ = null;
    }
    return this;
  }

  void _replace(covariant Value other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$Value$ = other;
  }

  @override
  void update(void Function(ValueBuilder builder) updates) {
    if (updates != null) updates(this);
  }

  @override
  Value build() {
    final _$result =
        _$Value$ ?? Value(prop1: prop1, prop2: prop2, prop3: prop3);
    _replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
