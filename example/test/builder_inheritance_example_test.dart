import 'package:example/builder_inheritance_example.dart';
import 'package:test/test.dart';

void main() {
  test('Parent abstract data class has builder with model properties', () {
    ModelA modelA = ModelE();

    var modelABuilder = modelA.toBuilder();
    modelABuilder.propA = '123';

    expect(modelABuilder.propA, '123');
  });

  test('Abstract builder has getter for properties with negative "createBuilderGetter"', () {
    ModelA modelA = ModelE();

    var modelABuilder = modelA.toBuilder();

    expect(modelABuilder.list, isNull);
  });

  test('Concrete builder has getter for properties with negative "createBuilderGetter"', () {
    var modelE = ModelE();

    var modelEBuilder = modelE.toBuilder();

    expect(modelEBuilder.list, isNull);
  });

  test('Child builder produces correct model', () {
    ModelA modelA = ModelE();

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

  test('Nested parent builders are supported', () {
    //todo fix
    // ModelD modelD = ModelE();
    // var modelDBuilder = modelD.toBuilder();
    // modelDBuilder.modelB = ModelB().toBuilder();
    // modelDBuilder.modelB.propA = 'propA';
    //
    // var newModelD = modelDBuilder.build();
    //
    // expect(newModelD.modelB.propA, 'propA');
  });
}
