import 'package:built_collection/built_collection.dart';
import 'package:data_class/data_class.dart';

part 'built_collection_example.g.dart';

@DataClass()
class Model {
  final BuiltList<String> list;
  final BuiltList list2;
  final BuiltSet<String> set;

  Model({this.list, this.list2, this.set});
}
