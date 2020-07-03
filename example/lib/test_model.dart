import 'package:data_class/data_class.dart';
import 'package:json_annotation/json_annotation.dart';

part 'test_model.g.dart';

@JsonSerializable()
class TestModel implements DataClass<TestModel> {
  final String name;
  final int age;

  TestModel({this.name, this.age});

  @override
  TestModel rebuild(Function(DataClassBuilder<TestModel>) updates) => _rebuild(updates);

  @override
  bool operator ==(other) => _equals(other);

  @override
  String toString() => _string;

  @override
  int get hashCode => _hashCode;

  Map<String, dynamic> toJson() => _$TestModelToJson(this);

  factory TestModel.fromJson(Map<String, dynamic> json) =>
      _$TestModelFromJson(json);
}
