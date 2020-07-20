import 'package:data_class/data_class.dart';

part 'inheritance_example.g.dart';

abstract class ModelA implements DataClass<ModelA, ModelABuilder> {
  final String propA;

  ModelA({this.propA});
}

class ModelB extends ModelA {
  final String propB1;
  final String propB2;

  ModelB({this.propB1, this.propB2, String propA}) : super(propA: propA);

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
  final int propC;

  ModelC({String propA, String propB1, this.propC})
      : super(propA: propA, propB1: propB1, propB2: 'fixedValue');

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
