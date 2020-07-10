import 'package:built_collection/built_collection.dart';
import 'package:example/json_serializable_example.dart';
import 'package:test/test.dart';

void main() {
  test('Data class can be serialized and deserialized', () {
    var model = Model<String>(
      prop2: 42,
      list: BuiltList<int>.of([1, 2, 3, 10]),
      genericProp: 'genericPropValue'
    );

    var json = model.toJson();
    var newModel = Model.fromJson(json);

    expect(model, newModel);
  });
}
