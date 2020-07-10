import 'package:built_collection/built_collection.dart';
import 'package:example/generic_example.dart';
import 'package:test/test.dart';

void main() {
  test('Generic data class can be rebuilt', () {
    var model = Model<String, int>(
      prop1: 'prop1',
      prop2: BuiltList<int>.of([1, 2, 3]),
    );

    var newModel = model.rebuild(
      (builder) => builder
        ..prop2.add(5)
        ..prop1 = 'prop1_new',
    );

    expect(
        newModel,
        Model<String, int>(
          prop1: 'prop1_new',
          prop2: BuiltList<int>.of([1, 2, 3, 5]),
        ));
  });
}
