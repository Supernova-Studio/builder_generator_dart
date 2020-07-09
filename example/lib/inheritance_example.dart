import 'package:data_class/data_class.dart';

part 'inheritance_example.g.dart';

abstract class ModelA {
  final String propA;

  ModelA({this.propA});
}

@DataClass()
class ModelB extends ModelA {
  final String propB1;
  final String propB2;

  ModelB({this.propB1, this.propB2, String propA}) : super(propA: propA);
}

@DataClass()
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
}
