import 'package:test/test.dart';
import 'package:example/builder_inheritance_example.dart';

void main() {
  test('Parent abstract data class has builder with model properties', () {
    ModelA modelA = ModelB();

    var modelABuilder = modelA.toBuilder();
    modelABuilder.propA = '123';
    modelABuilder.list.addAll([1, 2, 3]);

    expect(modelABuilder.propA, '123');
    expect(modelABuilder.list.build(), [1, 2, 3]);
  });

  test('Child builder produces correct model', () {
    ModelA modelA = ModelB();

    var modelABuilder = modelA.toBuilder();
    modelABuilder.propA = '123';
    var newModelA = modelABuilder.build();

    expect(newModelA.propA, '123');
  });

  test('Properties from multiple parents are propagated to child builder', () {
    ModelD modelD = ModelE(propA: 'propA');
    var modelDBuilder = modelD.toBuilder();
    modelDBuilder.propB2 = 'propB2';
    modelDBuilder.propC = 'propC';

    var newModelD = modelDBuilder.build();

    expect(newModelD.propA, 'propA');
    expect(newModelD.propB2, 'propB2');
    expect(newModelD.propC, 'propC');
  });
}
