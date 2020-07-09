import 'package:built_collection/built_collection.dart';
import 'package:data_class/data_class.dart';
import 'package:json_annotation/json_annotation.dart';

part 'json_serializable_example.g.dart';

@JsonSerializable()
@DataClass()
class Model {
  final String prop1;
  final int prop2;
  final BuiltList<int> list;

  const Model({this.prop1, this.prop2, this.list});

  @override
  bool operator ==(dynamic other) => _equals(other);

  @override
  String toString() => _string;

  @override
  int get hashCode => _hashCode;

  Map<String, dynamic> toJson() => _$ModelToJson(this);

  factory Model.fromJson(Map<String, dynamic> json) => _$ModelFromJson(json);
}
