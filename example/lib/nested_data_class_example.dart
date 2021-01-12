import 'package:data_class/data_class.dart';

part 'nested_data_class_example.g.dart';

class Node implements DataClass<Node, NodeBuilder> {
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

  @override
  Node rebuild(void Function(NodeBuilder) updates) => _rebuild(updates);

  @override
  NodeBuilder toBuilder() => _toBuilder();
}

class InnerModel implements DataClass<InnerModel, InnerModelBuilder> {
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

  @override
  InnerModel rebuild(void Function(InnerModelBuilder) updates) =>
      _rebuild(updates);

  @override
  InnerModelBuilder toBuilder() => _toBuilder();
}

class OuterModel implements DataClass<OuterModel, OuterModelBuilder> {
  final String prop;
  final InnerModel innerModel;

  OuterModel({this.prop, this.innerModel});

  @override
  bool operator ==(dynamic other) => _equals(other);

  @override
  String toString() => _string;

  @override
  int get hashCode => _hashCode;

  @override
  OuterModel rebuild(void Function(OuterModelBuilder) updates) =>
      _rebuild(updates);

  @override
  OuterModelBuilder toBuilder() => _toBuilder();
}
