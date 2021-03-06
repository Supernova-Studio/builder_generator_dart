// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inheritance_example.dart';

// **************************************************************************
// DataClassGenerator
// **************************************************************************

abstract class ModelABuilder
    implements DataClassBuilder<ModelA, ModelABuilder> {
  String get propA1;
  set propA1(String propA1);
  String get propA2;

  @override
  ModelA build();
}

abstract class ModelBBuilder implements ModelABuilder {
  String get propB1;
  set propB1(String propB1);
  String get propB2;

  String get propA1;
  set propA1(String propA1);

  @override
  ModelB build();
}

extension ModelCDataClassExtension on ModelC {
  ModelC _rebuild(void Function(ModelCBuilder builder) updates) =>
      (_toBuilder()..update(updates)).build();

  ModelCBuilder _toBuilder() => ModelCBuilder._().._replace(this);

  bool _equals(Object other) {
    if (identical(other, this)) return true;
    return other is ModelC &&
        propC == other.propC &&
        propB1 == other.propB1 &&
        propB2 == other.propB2 &&
        propA2 == other.propA2 &&
        propA1 == other.propA1;
  }

  int get _hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, propC.hashCode), propB1.hashCode), propB2.hashCode),
            propA2.hashCode),
        propA1.hashCode));
  }

  String get _string {
    return (newDataClassToStringHelper('ModelC')
          ..add('propC', propC)
          ..add('propB1', propB1)
          ..add('propB2', propB2)
          ..add('propA2', propA2)
          ..add('propA1', propA1))
        .toString();
  }
}

class ModelCBuilder implements ModelBBuilder {
  ModelC _$ModelC$;

  int _propC;
  int get propC => _$this._propC;
  set propC(int propC) => _$this._propC = propC;
  String _propB1;
  String get propB1 => _$this._propB1;
  set propB1(String propB1) => _$this._propB1 = propB1;
  String _propA1;
  String get propA1 => _$this._propA1;
  set propA1(String propA1) => _$this._propA1 = propA1;

  String _propB2;
  String get propB2 => _$this._propB2;
  String _propA2;
  String get propA2 => _$this._propA2;

  ModelCBuilder._();

  ModelCBuilder get _$this {
    if (_$ModelC$ != null) {
      _propC = _$ModelC$.propC;
      _propB1 = _$ModelC$.propB1;
      _propA1 = _$ModelC$.propA1;
      _propB2 = _$ModelC$.propB2;
      _propA2 = _$ModelC$.propA2;
      _$ModelC$ = null;
    }
    return this;
  }

  void _replace(covariant ModelC other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$ModelC$ = other;
  }

  @override
  void update(void Function(ModelCBuilder builder) updates) {
    if (updates != null) updates(this);
  }

  @override
  ModelC build() {
    final _$result =
        _$ModelC$ ?? ModelC(propC: propC, propB1: propB1, propA1: propA1);
    _replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
