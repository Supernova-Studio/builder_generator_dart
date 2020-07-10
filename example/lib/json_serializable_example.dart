import 'package:built_collection/built_collection.dart';
import 'package:data_class/data_class.dart';
import 'package:json_annotation/json_annotation.dart';

part 'json_serializable_example.g.dart';

@JsonSerializable()
@DataClass()
class Model<S> {
  final String prop1;
  final int prop2;
  final BuiltList<int> list;

  @_SimpleConverter()
  final S genericProp;

  const Model({this.prop1, this.prop2, this.list, this.genericProp});

  @override
  bool operator ==(dynamic other) => _equals(other);

  @override
  String toString() => _string;

  @override
  int get hashCode => _hashCode;

  Map<String, dynamic> toJson() => _$ModelToJson(this);

  factory Model.fromJson(Map<String, dynamic> json) => _$ModelFromJson(json);
}

class _SimpleConverter<T> implements JsonConverter<T, Map<String, dynamic>> {
  const _SimpleConverter();

  @override
  T fromJson(Map<String, dynamic> json) => json['value'] as T;

  @override
  Map<String, dynamic> toJson(T object) => {'value': object};
}