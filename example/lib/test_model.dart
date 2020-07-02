import 'package:built_value_custom/built_value.dart';
import 'package:built_value_custom/data_class.dart';

part 'test_model.g.dart';

//@JsonSerializable()
@DataClass()
class TestModel {
  final String name;

  TestModel({this.name});

  TestModel rebuild(Function(TestModelBuilder) updates) => _rebuild(updates);

  @override
  bool operator ==(other) => _equals(other);

  @override
  String toString() => _string;

  @override
  int get hashCode => _hashCode;

//  Map<String, dynamic> toJson() => _$TestModelToJson(this);
//
//  factory TestModel.fromJson(Map<String, dynamic> json) =>
//      _$TestModelFromJson(json);
}
