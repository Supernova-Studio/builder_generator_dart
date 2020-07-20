// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generic_example.dart';

// **************************************************************************
// DataClassGenerator
// **************************************************************************

extension ModelDataClassExtension<T, S> on Model<T, S> {
  Model<T, S> _rebuild(void Function(ModelBuilder<T, S> builder) updates) =>
      (_toBuilder()..update(updates)).build();

  ModelBuilder<T, S> _toBuilder() => ModelBuilder<T, S>().._replace(this);

  bool _equals(Object other) {
    if (identical(other, this)) return true;
    return other is Model &&
        prop1 == other.prop1 &&
        prop2 == other.prop2 &&
        prop3 == other.prop3;
  }

  int get _hashCode {
    return $jf(
        $jc($jc($jc(0, prop1.hashCode), prop2.hashCode), prop3.hashCode));
  }

  String get _string {
    return (newDataClassToStringHelper('Model')
          ..add('prop1', prop1)
          ..add('prop2', prop2)
          ..add('prop3', prop3))
        .toString();
  }
}

class ModelBuilder<T, S>
    implements DataClassBuilder<Model<T, S>, ModelBuilder<T, S>> {
  Model<T, S> _$ModelTS;

  T _prop1;
  T get prop1 => _$this._prop1;
  set prop1(T prop1) => _$this._prop1 = prop1;
  ListBuilder<S> _prop2;
  ListBuilder<S> get prop2 => _$this._prop2 ??= new ListBuilder<S>();
  set prop2(ListBuilder<S> prop2) => _$this._prop2 = prop2;
  String _prop3;
  String get prop3 => _$this._prop3;
  set prop3(String prop3) => _$this._prop3 = prop3;

  ModelBuilder();

  ModelBuilder<T, S> get _$this {
    if (_$ModelTS != null) {
      _prop1 = _$ModelTS.prop1;
      _prop2 = _$ModelTS.prop2?.toBuilder();
      _prop3 = _$ModelTS.prop3;
      _$ModelTS = null;
    }
    return this;
  }

  void _replace(covariant Model<T, S> other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$ModelTS = other;
  }

  @override
  void update(void Function(ModelBuilder<T, S> builder) updates) {
    if (updates != null) updates(this);
  }

  @override
  Model<T, S> build() {
    final _$result = _$ModelTS ??
        Model<T, S>(prop1: prop1, prop2: _prop2?.build(), prop3: prop3);
    _replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
