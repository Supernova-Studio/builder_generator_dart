import 'package:data_class/data_class.dart';

part 'nested_data_class_example.g.dart';

@DataClass()
class Node {
  final String label;
  final Node left;
  final Node right;

  Node({this.label, this.left, this.right});

  @override
  bool operator ==(dynamic other) => _equals(other);

  @override
  String toString() => _string;

  @override
  int get hashCode => _hashCode;
}

@DataClass()
class InnerModel {
  final String prop1;
  final String prop2;
  final String prop3;

  InnerModel({this.prop1, this.prop2, this.prop3});

  @override
  bool operator ==(dynamic other) => _equals(other);

  @override
  String toString() => _string;

  @override
  int get hashCode => _hashCode;
}

@DataClass()
class OuterModel {
  final String prop;
  final InnerModel innerModel;

  OuterModel({this.prop, this.innerModel});


  @override
  bool operator ==(dynamic other) => _equals(other);

  @override
  String toString() => _string;

  @override
  int get hashCode => _hashCode;
}
