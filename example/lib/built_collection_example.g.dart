// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'built_collection_example.dart';

// **************************************************************************
// DataClassGenerator
// **************************************************************************

extension ModelDataClassExtension on Model {
  Model rebuild(void Function(ModelBuilder builder) updates) =>
      (toBuilder()..update(updates)).build();

  ModelBuilder toBuilder() => ModelBuilder()..replace(this);

  bool _equals(Object other) {
    if (identical(other, this)) return true;
    return other is Model &&
        list == other.list &&
        list2 == other.list2 &&
        set == other.set;
  }

  int get _hashCode {
    return $jf($jc($jc($jc(0, list.hashCode), list2.hashCode), set.hashCode));
  }

  String get _string {
    return (newDataClassToStringHelper('Model')
          ..add('list', list)
          ..add('list2', list2)
          ..add('set', set))
        .toString();
  }
}

class ModelBuilder implements DataClassBuilder<Model, ModelBuilder> {
  Model _$v;

  ListBuilder<String> _list;
  ListBuilder<String> get list => _$this._list ??= new ListBuilder<String>();
  set list(ListBuilder<String> list) => _$this._list = list;

  BuiltList _list2;
  BuiltList get list2 => _$this._list2;
  set list2(BuiltList list2) => _$this._list2 = list2;

  SetBuilder<String> _set;
  SetBuilder<String> get set => _$this._set ??= new SetBuilder<String>();
  set set(SetBuilder<String> set) => _$this._set = set;

  ModelBuilder();

  ModelBuilder get _$this {
    if (_$v != null) {
      _list = _$v.list?.toBuilder();
      _list2 = _$v.list2;
      _set = _$v.set?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Model other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other;
  }

  @override
  void update(void Function(ModelBuilder builder) updates) {
    if (updates != null) updates(this);
  }

  @override
  Model build() {
    final _$result =
        _$v ?? Model(list: _list?.build(), list2: list2, set: _set?.build());
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
