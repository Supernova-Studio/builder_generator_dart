import 'package:example/nested_data_class_example.dart';
import 'package:test/test.dart';

void main() {
  group('Equation tests', () {
    test('Data classes with null properties are equal', () {
      var model1 = InnerModel();
      var model2 = InnerModel();

      expect(model1, model2);
    });

    test('Data classes with the same property values are equal', () {
      var model1 = InnerModel(prop1: 'prop1', prop2: 'prop2', prop3: null);
      var model2 = InnerModel(prop1: 'prop1', prop2: 'prop2', prop3: null);

      expect(model1, model2);
    });

    test('Data classes with one different property are not equal', () {
      var model1 = InnerModel(prop1: 'prop1', prop2: 'prop2');
      var model2 = InnerModel(prop1: 'prop1', prop2: 'another_prop2');

      expect(model1, isNot(model2));
    });

    test('The same data class is equal to itself', () {
      var model1 = InnerModel(prop1: 'prop1', prop2: 'prop2');

      expect(model1, model1);
    });

    test('Different types are not equal', () {
      var model1 = InnerModel(prop1: 'prop1', prop2: 'prop2');

      expect(model1, isNot('Another type'));
    });
  });

  group('Hash code tests', () {
    test('Data classes with null properties have the same code', () {
      var model1 = InnerModel();
      var model2 = InnerModel();

      expect(model1, model2);
    });

    test('Data classes with the same property values have the same hash code',
        () {
      var model1 = InnerModel(prop1: 'prop1', prop2: 'prop2', prop3: null);
      var model2 = InnerModel(prop1: 'prop1', prop2: 'prop2', prop3: null);

      expect(model1.hashCode, model2.hashCode);
    });

    test('Data classes with one different property have different hash codes',
        () {
      var model1 = InnerModel(prop1: 'prop1', prop2: 'prop2');
      var model2 = InnerModel(prop1: 'prop1', prop2: 'another_prop2');

      expect(model1.hashCode, isNot(model2.hashCode));
    });
  });

  group('Rebuild tests', () {
    test('Data classes can be rebuilt', () {
      var model1 = InnerModel(prop1: 'prop1', prop2: 'prop2');
      var model2 = model1.rebuild(
        (builder) => builder
          ..prop1 = null
          ..prop3 = 'prop3',
      );

      expect(model2.prop1, isNull);
      expect(model2.prop2, 'prop2');
      expect(model2.prop3, 'prop3');
    });
  });

  group('ToBuilder tests', () {
    test('Data classes can create builders', () {
      var model = InnerModel(prop1: 'prop1', prop2: 'prop2');
      var builder = model.toBuilder();

      expect(model.prop1, builder.prop1);
      expect(model.prop2, builder.prop2);
      expect(model.prop3, builder.prop3);
    });
  });

  group('Builder tests', () {
    test('Builder can be updated', () {
      var model1 = InnerModel(prop1: 'prop1', prop2: 'prop2');
      var builder = model1.toBuilder();

      builder.update((builder) {
        builder.prop1 = null;
        builder.prop3 = 'prop3';
      });

      expect(builder.prop1, isNull);
      expect(builder.prop2, 'prop2');
      expect(builder.prop3, 'prop3');
    });

    test('Builder can be built', () {
      var model1 = InnerModel(prop1: 'prop1', prop2: 'prop2');
      var builder = model1.toBuilder();

      var model2 = builder.build();

      expect(model1.prop1, model2.prop1);
      expect(model1.prop2, model2.prop2);
      expect(model1.prop3, model2.prop3);
    });
  });

  group('Nested data class tests', () {
    test('Inner data class can be rebuilt', () {
      var outerModel = OuterModel(
        innerModel: InnerModel(prop2: 'prop2'),
      );

      var newOuterModel = outerModel.rebuild((builder) => builder
        ..prop = 'prop'
        ..innerModel.prop1 = 'prop1');

      expect(newOuterModel.prop, 'prop');
      expect(
          newOuterModel.innerModel, InnerModel(prop1: 'prop1', prop2: 'prop2'));
    });

    test('Null inner data class can be rebuilt', () {
      var outerModel = OuterModel();

      var newOuterModel = outerModel.rebuild((builder) {
        builder.innerModel = InnerModel().toBuilder();

        return builder
          ..prop = 'prop'
          ..innerModel.prop1 = 'prop1';
      });

      expect(newOuterModel.prop, 'prop');
      expect(newOuterModel.innerModel, InnerModel(prop1: 'prop1'));
    });

    test('Chain of inner data classes can be rebuilt', () {
      var node = Node();

      var newNode = node.rebuild((builder) {
        builder.left = Node().toBuilder();
        builder.left.right = Node().toBuilder();
        builder.left.right.left = Node().toBuilder();
        builder.left.right.left.left = Node().toBuilder();

        builder.left.right.left.left.label = 'Leaf1';
      });

      expect(newNode.left.right.left.left.label, 'Leaf1');
    });

    test('Nested builder is nullable', () {
      var node = Node();

      var nodeBuilder = node.toBuilder();

      expect(nodeBuilder.right, isNull);
      expect(nodeBuilder.left, isNull);
    });
  });
}
