import 'package:built_collection/built_collection.dart';
import 'package:data_class/data_class.dart';
import 'package:json_annotation/json_annotation.dart';

part 'built_list_example.g.dart';

@DataClass()
@JsonSerializable()
class BuiltListModel {
  final BuiltList<String> property;

  BuiltListModel({this.property});

  factory BuiltListModel.fromJson(Map<String, dynamic> json) =>
      _$BuiltListModelFromJson(json);

  Map<String, dynamic> toJson() => _$BuiltListModelToJson(this);
}

void main() {
  var model1 = BuiltListModel(property: BuiltList.build((builder) {
    builder.addAll(["test", "test2", "123"]);
  }));

  var json = model1.toJson();
  print(json);

  var model2 = BuiltListModel.fromJson(json);
  print(model2.property);
}
