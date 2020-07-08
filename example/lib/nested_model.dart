import 'package:data_class/data_class.dart';

part 'nested_model.g.dart';

@DataClass()
class NodeDataClass {
  final String label;
  final NodeDataClass left;
  final NodeDataClass right;

  NodeDataClass({this.label, this.left, this.right});
}

void main() {
  var node = NodeDataClass();
  node = node.rebuild((builder) => builder
    ..left.label = 'I’m a leaf!'
    ..left.left.right.right.label = 'I’m also a leaf!');

  print(node.left.label);
  print(node.left.left.right.right.label);
}
