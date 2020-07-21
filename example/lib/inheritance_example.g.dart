// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inheritance_example.dart';

// **************************************************************************
// DataClassGenerator
// **************************************************************************

abstract class ModelABuilder
    implements DataClassBuilder<ModelA, ModelABuilder> {
  String get propA;
  set propA(String propA);

  ModelABuilder();

  @override
  ModelA build();
}

extension ModelBDataClassExtension on ModelB {
  ModelB _rebuild(void Function(ModelBBuilder builder) updates) =>
      (_toBuilder()..update(updates)).build();

  ModelBBuilder _toBuilder() => ModelBBuilder().._replace(this);

  bool _equals(Object other) {
    if (identical(other, this)) return true;
    return other is ModelB &&
        propB1 == other.propB1 &&
        propB2 == other.propB2 &&
        propA == other.propA;
  }

  int get _hashCode {
    return $jf(
        $jc($jc($jc(0, propB1.hashCode), propB2.hashCode), propA.hashCode));
  }

  String get _string {
    return (newDataClassToStringHelper('ModelB')
          ..add('propB1', propB1)
          ..add('propB2', propB2)
          ..add('propA', propA))
        .toString();
  }
}

class ModelBBuilder extends ModelABuilder {
  ModelB _$ModelB;

  String _propB1;
  String get propB1 => _$this._propB1;
  set propB1(String propB1) => _$this._propB1 = propB1;
  String _propB2;
  String get propB2 => _$this._propB2;
  set propB2(String propB2) => _$this._propB2 = propB2;
  String _propA;
  String get propA => _$this._propA;
  set propA(String propA) => _$this._propA = propA;

  ModelBBuilder();

  ModelBBuilder get _$this {
    if (_$ModelB != null) {
      _propB1 = _$ModelB.propB1;
      _propB2 = _$ModelB.propB2;
      _propA = _$ModelB.propA;
      _$ModelB = null;
    }
    return this;
  }

  void _replace(covariant ModelB other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$ModelB = other;
  }

  @override
  void update(void Function(ModelBBuilder builder) updates) {
    if (updates != null) updates(this);
  }

  @override
  ModelB build() {
    final _$result =
        _$ModelB ?? ModelB(propB1: propB1, propB2: propB2, propA: propA);
    _replace(_$result);
    return _$result;
  }
}

extension ModelCDataClassExtension on ModelC {
  ModelC _rebuild(void Function(ModelCBuilder builder) updates) =>
      (_toBuilder()..update(updates)).build();

  ModelCBuilder _toBuilder() => ModelCBuilder().._replace(this);

  bool _equals(Object other) {
    if (identical(other, this)) return true;
    return other is ModelC &&
        propC == other.propC &&
        propB1 == other.propB1 &&
        propB2 == other.propB2 &&
        propA == other.propA;
  }

  int get _hashCode {
    return $jf($jc(
        $jc($jc($jc(0, propC.hashCode), propB1.hashCode), propB2.hashCode),
        propA.hashCode));
  }

  String get _string {
    return (newDataClassToStringHelper('ModelC')
          ..add('propC', propC)
          ..add('propB1', propB1)
          ..add('propB2', propB2)
          ..add('propA', propA))
        .toString();
  }
}

class ModelCBuilder extends ModelBBuilder {
  ModelC _$ModelC;

  int _propC;
  int get propC => _$this._propC;
  set propC(int propC) => _$this._propC = propC;
  String _propB1;
  String get propB1 => _$this._propB1;
  set propB1(String propB1) => _$this._propB1 = propB1;
  String _propA;
  String get propA => _$this._propA;
  set propA(String propA) => _$this._propA = propA;

  ModelCBuilder();

  ModelCBuilder get _$this {
    if (_$ModelC != null) {
      _propC = _$ModelC.propC;
      _propB1 = _$ModelC.propB1;
      _propA = _$ModelC.propA;
      _$ModelC = null;
    }
    return this;
  }

  void _replace(covariant ModelC other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$ModelC = other;
  }

  @override
  void update(void Function(ModelCBuilder builder) updates) {
    if (updates != null) updates(this);
  }

  @override
  ModelC build() {
    final _$result =
        _$ModelC ?? ModelC(propC: propC, propB1: propB1, propA: propA);
    _replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
