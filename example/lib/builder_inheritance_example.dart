import 'package:built_collection/built_collection.dart';
import 'package:data_class/data_class.dart';

part 'builder_inheritance_example.g.dart';

abstract class ModelA implements DataClass<ModelA, ModelABuilder> {
  final String propA;
  final BuiltList<int> list;

  ModelA({this.propA, this.list});
}

class ModelB extends ModelA {
  final String propB1;
  final String propB2;

  ModelB({this.propB1, this.propB2, String propA, BuiltList<int> list})
      : super(propA: propA, list: list);

  @override
  bool operator ==(dynamic other) => _equals(other);

  @override
  String toString() => _string;

  @override
  int get hashCode => _hashCode;

  @override
  ModelB rebuild(void Function(ModelBBuilder) updates) => _rebuild(updates);

  @override
  ModelBBuilder toBuilder() => _toBuilder();
}

class ModelC extends ModelB {
  final String propC;

  ModelC({this.propC, String propB1, String propB2, String propA})
      : super(propB1: propB1, propB2: propB2, propA: propA);

  @override
  bool operator ==(dynamic other) => _equals(other);

  @override
  String toString() => _string;

  @override
  int get hashCode => _hashCode;

  @override
  ModelC rebuild(void Function(ModelCBuilder) updates) => _rebuild(updates);

  @override
  ModelCBuilder toBuilder() => _toBuilder();
}

abstract class ModelD extends ModelC {
  ModelD({String propC, String propB1, String propB2, String propA})
      : super(propC: propC, propB1: propB1, propB2: propB2, propA: propA);
}

class ModelE extends ModelD {
  final String propE;

  ModelE({this.propE, String propC, String propB1, String propB2, String propA})
      : super(propC: propC, propB1: propB1, propB2: propB2, propA: propA);

  @override
  bool operator ==(dynamic other) => _equals(other);

  @override
  String toString() => _string;

  @override
  int get hashCode => _hashCode;

  @override
  ModelE rebuild(void Function(ModelEBuilder) updates) => _rebuild(updates);

  @override
  ModelEBuilder toBuilder() => _toBuilder();
}

void main() {
  ModelA modelA = ModelB();

  var modelABuilder = modelA.toBuilder();
  modelABuilder.propA = '123';
  modelABuilder.list.addAll([1, 2, 3]);
  var newModelA = modelABuilder.build();

  print(newModelA);

  ModelB modelB = ModelC();

  var modelBBuilder = modelB.toBuilder();
  modelBBuilder.propB1 = 'b1';
  modelBBuilder.propA = 'a';
  var newModelB = modelBBuilder.build();

  print(newModelB);

  ModelD modelD = ModelE(propA: 'propA');
  var modelDBuilder = modelD.toBuilder();
  modelDBuilder.propB2 = 'propB2';
  modelDBuilder.propC = 'propC';
  var newModelD = modelDBuilder.build();

  print(newModelD);
}
