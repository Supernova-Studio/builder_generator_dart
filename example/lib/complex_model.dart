import 'package:data_class/data_class.dart';
import 'package:json_annotation/json_annotation.dart';

part 'complex_model.g.dart';

abstract class AModel {
  final String propA;

  String get getterA;

  AModel({this.propA});
}

@DataClass()
class BModel extends AModel {
  final String propB1;
  final String propB2;

  @override
  String get getterA => 'getterA in BModel';

  BModel({this.propB1, this.propB2, String propA}) : super(propA: propA);
}

@DataClass()
@JsonSerializable()
class CModel<T> extends BModel {
  //
  /// Properties
  // --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
  @JsonKey(ignore: true)
  final T genericProp;

  bool get someGetter => false;

  set someSetter(String input) => null;

  @override
  String get getterA => 'value';
  static String staticMember = 'value';

  //
  /// Constructor
  // --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---

  CModel({String propA, String propB1, this.genericProp})
      : super(propA: propA, propB1: propB1, propB2: 'fixedValue');

  //
  /// Data class members
  // --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---

  @override
  bool operator ==(dynamic other) => this._equals(other);

  @override
  String toString() => this._string;

  @override
  int get hashCode => this._hashCode;

  //
  /// Mapping
  // --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---

  Map<String, dynamic> toJson() => _$CModelToJson(this);

  factory CModel.fromJson(Map<String, dynamic> json) => _$CModelFromJson(json);
}

void main() {
  var model = CModel<String>();

  var newModel = model.rebuild((CModelBuilder<String> builder) {
    builder.genericProp = '123';
  });

  print(newModel.genericProp);
}
