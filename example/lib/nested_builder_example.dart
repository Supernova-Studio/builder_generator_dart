import 'package:built_collection/built_collection.dart';
import 'package:data_class/data_class.dart';

part 'nested_builder_example.g.dart';

@DataClass()
class NodeDataClass {
  final String label;
  final NodeDataClass left;
  final NodeDataClass right;
  final BuiltList<String> values;

  NodeDataClass({this.label, this.left, this.right, this.values});
}

void main() {
  var node = NodeDataClass();
  node = node.rebuild((builder) => builder
    ..left.label = 'I’m a leaf!'
    ..left.values.add("dsd")
    ..left.left.right.right.label = 'I’m also a leaf!');

  print(node.left.label);
  print(node.left.left.right.right.label);
}
