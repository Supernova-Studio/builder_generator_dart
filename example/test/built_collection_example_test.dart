import 'package:built_collection/built_collection.dart';
import 'package:example/built_collection_example.dart';
import 'package:test/test.dart';

void main() {
  test('Built collections can be rebuilt', () {
    var dataClass = Model(
      list: BuiltList<String>.from(['list_item']),
      list2: BuiltList<String>.from(['list2_item']),
    );

    var rebuiltDataClass = dataClass.rebuild(
      (ModelBuilder builder) {
        builder.set = SetBuilder<String>();

        builder
          ..set.addAll(['set_item1', 'set_item2'])
          ..list.add('list_item_new');
      },
    );

    expect(dataClass.set, isNull);
    expect(dataClass.list, BuiltList<String>.from(['list_item']));
    expect(dataClass.list2, BuiltList<String>.from(['list2_item']));

    expect(rebuiltDataClass.set,
        BuiltSet<String>.from(['set_item1', 'set_item2']));
    expect(rebuiltDataClass.list,
        BuiltList<String>.from(['list_item', 'list_item_new']));
    expect(rebuiltDataClass.list2, BuiltList<String>.from(['list2_item']));
  });

  test('Nested builder is nullable', () {
    var dataClass = Model();

    var builder = dataClass.toBuilder();

    expect(builder.list, isNull);
    expect(builder.set, isNull);
    expect(builder.list2, isNull);
  });
}
