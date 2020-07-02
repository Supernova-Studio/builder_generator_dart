import 'package:built_value_custom/built_value.dart';

part 'test_model.g.dart';

//@JsonSerializable()
class TestModel implements Built<TestModel, TestModelBuilder> {
  final String name;

  TestModel({this.name});

  @override
  TestModel rebuild(Function(TestModelBuilder) updates) => _rebuild(updates);

  @override
  bool operator ==(other) => this._equals(other);

  @override
  String toString() => this._string;

  @override
  int get hashCode => this._hashCode;

//  Map<String, dynamic> toJson() => _$TestModelToJson(this);
//
//  factory TestModel.fromJson(Map<String, dynamic> json) =>
//      _$TestModelFromJson(json);
}
