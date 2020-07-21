// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'builder_inheritance_example.dart';

// **************************************************************************
// DataClassGenerator
// **************************************************************************

abstract class ModelABuilder
    implements DataClassBuilder<ModelA, ModelABuilder> {
  String get propA;
  set propA(String propA);
  ListBuilder<int> get list;
  set list(ListBuilder<int> list);

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
        propA == other.propA &&
        list == other.list;
  }

  int get _hashCode {
    return $jf($jc(
        $jc($jc($jc(0, propB1.hashCode), propB2.hashCode), propA.hashCode),
        list.hashCode));
  }

  String get _string {
    return (newDataClassToStringHelper('ModelB')
          ..add('propB1', propB1)
          ..add('propB2', propB2)
          ..add('propA', propA)
          ..add('list', list))
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
  ListBuilder<int> _list;
  ListBuilder<int> get list => _$this._list ??= new ListBuilder<int>();
  set list(ListBuilder<int> list) => _$this._list = list;

  ModelBBuilder();

  ModelBBuilder get _$this {
    if (_$ModelB != null) {
      _propB1 = _$ModelB.propB1;
      _propB2 = _$ModelB.propB2;
      _propA = _$ModelB.propA;
      _list = _$ModelB.list?.toBuilder();
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
    final _$result = _$ModelB ??
        ModelB(
            propB1: propB1, propB2: propB2, propA: propA, list: _list?.build());
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
        propA == other.propA &&
        list == other.list;
  }

  int get _hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, propC.hashCode), propB1.hashCode), propB2.hashCode),
            propA.hashCode),
        list.hashCode));
  }

  String get _string {
    return (newDataClassToStringHelper('ModelC')
          ..add('propC', propC)
          ..add('propB1', propB1)
          ..add('propB2', propB2)
          ..add('propA', propA)
          ..add('list', list))
        .toString();
  }
}

class ModelCBuilder extends ModelBBuilder {
  ModelC _$ModelC;

  String _propC;
  String get propC => _$this._propC;
  set propC(String propC) => _$this._propC = propC;
  String _propB1;
  String get propB1 => _$this._propB1;
  set propB1(String propB1) => _$this._propB1 = propB1;
  String _propB2;
  String get propB2 => _$this._propB2;
  set propB2(String propB2) => _$this._propB2 = propB2;
  String _propA;
  String get propA => _$this._propA;
  set propA(String propA) => _$this._propA = propA;

  ModelCBuilder();

  ModelCBuilder get _$this {
    if (_$ModelC != null) {
      _propC = _$ModelC.propC;
      _propB1 = _$ModelC.propB1;
      _propB2 = _$ModelC.propB2;
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
    final _$result = _$ModelC ??
        ModelC(propC: propC, propB1: propB1, propB2: propB2, propA: propA);
    _replace(_$result);
    return _$result;
  }
}

abstract class ModelDBuilder extends ModelCBuilder {
  ModelBBuilder get modelB;
  set modelB(ModelBBuilder modelB);
  String get propC;
  set propC(String propC);
  String get propB1;
  set propB1(String propB1);
  String get propB2;
  set propB2(String propB2);
  String get propA;
  set propA(String propA);

  ModelDBuilder();

  @override
  ModelD build();
}

extension ModelEDataClassExtension on ModelE {
  ModelE _rebuild(void Function(ModelEBuilder builder) updates) =>
      (_toBuilder()..update(updates)).build();

  ModelEBuilder _toBuilder() => ModelEBuilder().._replace(this);

  bool _equals(Object other) {
    if (identical(other, this)) return true;
    return other is ModelE &&
        propE == other.propE &&
        modelB == other.modelB &&
        propC == other.propC &&
        propB1 == other.propB1 &&
        propB2 == other.propB2 &&
        propA == other.propA &&
        list == other.list;
  }

  int get _hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, propE.hashCode), modelB.hashCode),
                        propC.hashCode),
                    propB1.hashCode),
                propB2.hashCode),
            propA.hashCode),
        list.hashCode));
  }

  String get _string {
    return (newDataClassToStringHelper('ModelE')
          ..add('propE', propE)
          ..add('modelB', modelB)
          ..add('propC', propC)
          ..add('propB1', propB1)
          ..add('propB2', propB2)
          ..add('propA', propA)
          ..add('list', list))
        .toString();
  }
}

class ModelEBuilder extends ModelDBuilder {
  ModelE _$ModelE;

  String _propE;
  String get propE => _$this._propE;
  set propE(String propE) => _$this._propE = propE;
  ModelBBuilder _modelB;
  ModelBBuilder get modelB => _$this._modelB ??= new ModelBBuilder();
  set modelB(ModelBBuilder modelB) => _$this._modelB = modelB;
  String _propC;
  String get propC => _$this._propC;
  set propC(String propC) => _$this._propC = propC;
  String _propB1;
  String get propB1 => _$this._propB1;
  set propB1(String propB1) => _$this._propB1 = propB1;
  String _propB2;
  String get propB2 => _$this._propB2;
  set propB2(String propB2) => _$this._propB2 = propB2;
  String _propA;
  String get propA => _$this._propA;
  set propA(String propA) => _$this._propA = propA;

  ModelEBuilder();

  ModelEBuilder get _$this {
    if (_$ModelE != null) {
      _propE = _$ModelE.propE;
      _modelB = _$ModelE.modelB?.toBuilder();
      _propC = _$ModelE.propC;
      _propB1 = _$ModelE.propB1;
      _propB2 = _$ModelE.propB2;
      _propA = _$ModelE.propA;
      _$ModelE = null;
    }
    return this;
  }

  void _replace(covariant ModelE other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$ModelE = other;
  }

  @override
  void update(void Function(ModelEBuilder builder) updates) {
    if (updates != null) updates(this);
  }

  @override
  ModelE build() {
    final _$result = _$ModelE ??
        ModelE(
            propE: propE,
            modelB: _modelB?.build(),
            propC: propC,
            propB1: propB1,
            propB2: propB2,
            propA: propA);
    _replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
