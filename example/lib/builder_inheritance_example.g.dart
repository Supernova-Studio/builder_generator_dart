// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'builder_inheritance_example.dart';

// **************************************************************************
// DataClassGenerator
// **************************************************************************

abstract class ModelABuilder
    implements DataClassBuilder<ModelA, ModelABuilder> {
  String get propA;
  ListBuilder<int> get list;

  ModelABuilder._();

  @override
  ModelA build();
}

abstract class ModelBBuilder implements ModelABuilder {
  String get propB1;
  String get propB2;
  String get propA;
  ListBuilder<int> get list;

  ModelBBuilder._();

  @override
  ModelB build();
}

abstract class ModelCBuilder implements ModelBBuilder {
  String get propC;
  String get propB1;
  String get propB2;
  String get propA;

  ModelCBuilder._();

  @override
  ModelC build();
}

abstract class ModelDBuilder implements ModelCBuilder {
  ModelB get modelB;
  String get propC;
  String get propB1;
  String get propB2;
  String get propA;

  ModelDBuilder._();

  @override
  ModelD build();
}

extension ModelEDataClassExtension on ModelE {
  ModelE _rebuild(void Function(ModelEBuilder builder) updates) =>
      (_toBuilder()..update(updates)).build();

  ModelEBuilder _toBuilder() => ModelEBuilder._().._replace(this);

  bool _equals(Object other) {
    if (identical(other, this)) return true;
    return other is ModelE &&
        propE == other.propE &&
        modelA == other.modelA &&
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
                    $jc(
                        $jc($jc($jc(0, propE.hashCode), modelA.hashCode),
                            modelB.hashCode),
                        propC.hashCode),
                    propB1.hashCode),
                propB2.hashCode),
            propA.hashCode),
        list.hashCode));
  }

  String get _string {
    return (newDataClassToStringHelper('ModelE')
          ..add('propE', propE)
          ..add('modelA', modelA)
          ..add('modelB', modelB)
          ..add('propC', propC)
          ..add('propB1', propB1)
          ..add('propB2', propB2)
          ..add('propA', propA)
          ..add('list', list))
        .toString();
  }
}

class ModelEBuilder implements ModelDBuilder {
  ModelE _$ModelE$;

  String _propE;
  String get propE => _$this._propE;
  set propE(String propE) => _$this._propE = propE;
  ModelA _modelA;
  ModelA get modelA => _$this._modelA;
  set modelA(ModelA modelA) => _$this._modelA = modelA;
  ModelB _modelB;
  ModelB get modelB => _$this._modelB;
  set modelB(ModelB modelB) => _$this._modelB = modelB;
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

  ListBuilder<int> _list;
  @override
  ListBuilder<int> get list => _$this._list;

  ModelEBuilder._();

  ModelEBuilder get _$this {
    if (_$ModelE$ != null) {
      _propE = _$ModelE$.propE;
      _modelA = _$ModelE$.modelA;
      _modelB = _$ModelE$.modelB;
      _propC = _$ModelE$.propC;
      _propB1 = _$ModelE$.propB1;
      _propB2 = _$ModelE$.propB2;
      _propA = _$ModelE$.propA;
      _list = _$ModelE$.list?.toBuilder();
      _$ModelE$ = null;
    }
    return this;
  }

  void _replace(covariant ModelE other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$ModelE$ = other;
  }

  @override
  void update(void Function(ModelEBuilder builder) updates) {
    if (updates != null) updates(this);
  }

  @override
  ModelE build() {
    final _$result = _$ModelE$ ??
        ModelE(
            propE: propE,
            modelA: modelA,
            modelB: modelB,
            propC: propC,
            propB1: propB1,
            propB2: propB2,
            propA: propA);
    _replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
