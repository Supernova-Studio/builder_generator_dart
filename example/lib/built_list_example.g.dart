// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'built_list_example.dart';

// **************************************************************************
// DataClassGenerator
// **************************************************************************

extension _$BuiltListModelDataClassExtension on BuiltListModel {
  BuiltListModel rebuild(
          void Function(BuiltListModelBuilder builder) updates) =>
      (toBuilder()..update(updates)).build();

  BuiltListModelBuilder toBuilder() => BuiltListModelBuilder()..replace(this);

  bool _equals(Object other) {
    if (identical(other, this)) return true;
    return other is BuiltListModel && property == other.property;
  }

  int get _hashCode {
    return $jf($jc(0, property.hashCode));
  }

  String get _string {
    return (newDataClassToStringHelper('BuiltListModel')
          ..add('property', property))
        .toString();
  }
}

class BuiltListModelBuilder
    implements DataClassBuilder<BuiltListModel, BuiltListModelBuilder> {
  BuiltListModel _$v;

  ListBuilder<String> _property;
  ListBuilder<String> get property =>
      _$this._property ??= new ListBuilder<String>();
  set property(ListBuilder<String> property) => _$this._property = property;

  BuiltListModelBuilder();

  BuiltListModelBuilder get _$this {
    if (_$v != null) {
      _property = _$v.property?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BuiltListModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other;
  }

  @override
  void update(void Function(BuiltListModelBuilder builder) updates) {
    if (updates != null) updates(this);
  }

  @override
  BuiltListModel build() {
    final _$result = _$v ?? BuiltListModel(property: _property?.build());
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BuiltListModel _$BuiltListModelFromJson(Map<String, dynamic> json) {
  return BuiltListModel(
    property: json['property'] != null
        ? (json['property'] as List).map((e) => e as String).toBuiltList()
        : null,
  );
}

Map<String, dynamic> _$BuiltListModelToJson(BuiltListModel instance) =>
    <String, dynamic>{
      'property': instance.property?.toList(),
    };
