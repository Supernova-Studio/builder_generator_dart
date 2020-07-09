import 'package:data_class/data_class.dart';

part 'nested_data_class_example.g.dart';

@DataClass()
class Node {
  final String label;
  final Node left;
  final Node right;

  Node({this.label, this.left, this.right});
}

@DataClass()
class InnerModel {
  final String prop;

  InnerModel({this.prop});
}

@DataClass()
class OuterModel {
  final String prop;
  final InnerModel innerModel;

  OuterModel({this.prop, this.innerModel});
}
