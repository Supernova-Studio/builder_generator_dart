import 'package:example/inheritance_example.dart';
import 'package:test/test.dart';

void main() {
  test('Parent data class property is used in comparison and hash code', () {
    var modelC1 = ModelC(propA1: 'propA1', propB1: 'propB1_1', propC: 1);
    var modelC2 = ModelC(propA1: 'propA1', propB1: 'propB1_2', propC: 1);

    expect(modelC1, isNot(modelC2));
    expect(modelC1.hashCode, isNot(modelC2.hashCode));
  });

  test('Parent abstract class property is used in comparison and hash code',
      () {
    var modelC1 = ModelC(propA1: 'propA1_1', propB1: 'propB1', propC: 1);
    var modelC2 = ModelC(propA1: 'propA1_2', propB1: 'propB1', propC: 1);

    expect(modelC1, isNot(modelC2));
    expect(modelC1.hashCode, isNot(modelC2.hashCode));
  });

  test('Same data classes are equal and have the same hash code', () {
    var modelC1 = ModelC(propA1: 'propA1', propB1: 'propB1', propC: 1);
    var modelC2 = ModelC(propA1: 'propA1', propB1: 'propB1', propC: 1);

    expect(modelC1, modelC2);
    expect(modelC1.hashCode, modelC2.hashCode);
  });
}
