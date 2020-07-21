// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'json_serializable_example.dart';

// **************************************************************************
// DataClassGenerator
// **************************************************************************

extension ModelDataClassExtension<S> on Model<S> {
  Model<S> _rebuild(void Function(ModelBuilder<S> builder) updates) =>
      (_toBuilder()..update(updates)).build();

  ModelBuilder<S> _toBuilder() => ModelBuilder<S>().._replace(this);

  bool _equals(Object other) {
    if (identical(other, this)) return true;
    return other is Model &&
        prop1 == other.prop1 &&
        prop2 == other.prop2 &&
        list == other.list &&
        genericProp == other.genericProp;
  }

  int get _hashCode {
    return $jf($jc(
        $jc($jc($jc(0, prop1.hashCode), prop2.hashCode), list.hashCode),
        genericProp.hashCode));
  }

  String get _string {
    return (newDataClassToStringHelper('Model')
          ..add('prop1', prop1)
          ..add('prop2', prop2)
          ..add('list', list)
          ..add('genericProp', genericProp))
        .toString();
  }
}

class ModelBuilder<S> implements DataClassBuilder<Model<S>, ModelBuilder<S>> {
  Model<S> _$Model$S;

  String _prop1;
  String get prop1 => _$this._prop1;
  set prop1(String prop1) => _$this._prop1 = prop1;
  int _prop2;
  int get prop2 => _$this._prop2;
  set prop2(int prop2) => _$this._prop2 = prop2;
  ListBuilder<int> _list;
  ListBuilder<int> get list => _$this._list ??= new ListBuilder<int>();
  set list(ListBuilder<int> list) => _$this._list = list;
  S _genericProp;
  S get genericProp => _$this._genericProp;
  set genericProp(S genericProp) => _$this._genericProp = genericProp;

  ModelBuilder();

  ModelBuilder<S> get _$this {
    if (_$Model$S != null) {
      _prop1 = _$Model$S.prop1;
      _prop2 = _$Model$S.prop2;
      _list = _$Model$S.list?.toBuilder();
      _genericProp = _$Model$S.genericProp;
      _$Model$S = null;
    }
    return this;
  }

  void _replace(covariant Model<S> other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$Model$S = other;
  }

  @override
  void update(void Function(ModelBuilder<S> builder) updates) {
    if (updates != null) updates(this);
  }

  @override
  Model<S> build() {
    final _$result = _$Model$S ??
        Model<S>(
            prop1: prop1,
            prop2: prop2,
            list: _list?.build(),
            genericProp: genericProp);
    _replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Model<S> _$ModelFromJson<S>(Map<String, dynamic> json) {
  return Model<S>(
    prop1: json['prop1'] as String,
    prop2: json['prop2'] as int,
    list: json['list'] != null
        ? (json['list'] as List).map((e) => e as int).toBuiltList()
        : null,
    genericProp: _SimpleConverter<S>()
        .fromJson(json['genericProp'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ModelToJson<S>(Model<S> instance) => <String, dynamic>{
      'prop1': instance.prop1,
      'prop2': instance.prop2,
      'list': instance.list?.toList(),
      'genericProp': _SimpleConverter<S>().toJson(instance.genericProp),
    };
