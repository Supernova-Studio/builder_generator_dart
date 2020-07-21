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
  final ModelB modelB;

  ModelD(
      {this.modelB, String propC, String propB1, String propB2, String propA})
      : super(propC: propC, propB1: propB1, propB2: propB2, propA: propA);


  @override
  ModelD rebuild(void Function(ModelCBuilder) updates);

  @override
  ModelDBuilder toBuilder();
}

class ModelE extends ModelD {
  final String propE;

  ModelE({
    this.propE,
    ModelB modelB,
    String propC,
    String propB1,
    String propB2,
    String propA,
  }) : super(
          modelB: modelB,
          propC: propC,
          propB1: propB1,
          propB2: propB2,
          propA: propA,
        );

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
