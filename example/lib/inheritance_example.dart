import 'package:data_class/data_class.dart';

part 'inheritance_example.g.dart';

abstract class ModelA implements DataClass<ModelA, ModelABuilder> {
  final String propA1;

  @DataClassField(createBuilderSetter: false)
  final String propA2;

  ModelA({this.propA1, this.propA2});
}

abstract class ModelB extends ModelA {
  final String propB1;

  @DataClassField(createBuilderSetter: false)
  final String propB2;

  @override
  final String propA2;

  ModelB({this.propB1, this.propB2, String propA1}) : this.propA2 = 'propA2', super(propA1: propA1);
}

class ModelC extends ModelB {
  final int propC;

  ModelC({String propA1, String propB1, this.propC})
      : super(propA1: propA1, propB1: propB1, propB2: 'fixedValue');

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
