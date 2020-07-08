// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'complex_model.dart';

// **************************************************************************
// DataClassGenerator
// **************************************************************************

extension _$BModelDataClassExtension on BModel {
  BModel rebuild(void Function(BModelBuilder builder) updates) =>
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
  void update(void Function(BModelBuilder builder) updates) {
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
  CModel<T> rebuild(void Function(CModelBuilder<T> builder) updates) =>
      (toBuilder()..update(updates)).build();

  CModelBuilder<T> toBuilder() => CModelBuilder<T>()..replace(this);

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
    return (newDataClassToStringHelper('CModel')
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
  void update(void Function(CModelBuilder<T> builder) updates) {
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
