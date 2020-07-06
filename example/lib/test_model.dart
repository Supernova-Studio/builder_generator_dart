import 'package:built_collection/built_collection.dart';
import 'package:data_class/data_class.dart';
import 'package:json_annotation/json_annotation.dart';

part 'test_model.g.dart';

@JsonSerializable()
@DataClass()
class InnerTestModel {
  //
  /// Properties
  // --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
  final String someProperty;

  //
  /// Constructor
  // --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---

  InnerTestModel({this.someProperty});

  //
  /// Data class members
  // --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---

  @override
  InnerTestModel rebuild(Function(InnerTestModelBuilder) updates) =>
      _rebuild(updates);

  @override
  bool operator ==(other) => this._equals(other);

  @override
  String toString() => this._string;

  @override
  int get hashCode => this._hashCode;

  //
  /// Mapping
  // --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---

  Map<String, dynamic> toJson() => _$InnerTestModelToJson(this);

  factory InnerTestModel.fromJson(Map<String, dynamic> json) =>
      _$InnerTestModelFromJson(json);
}

@JsonSerializable()
@DataClass()
class TestModel {
  //
  /// Properties
  // --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
  final String name;
  final int age;
  final List<String> list;
  final InnerTestModel innerTestModel;

  //
  /// Constructor
  // --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---

  TestModel({this.name, this.age, this.list, this.innerTestModel});

  //
  /// Data class members
  // --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---

  @override
  TestModel rebuild(Function(TestModelBuilder) updates) => _rebuild(updates);

  @override
  bool operator ==(other) => this._equals(other);

  @override
  String toString() => this._string;

  @override
  int get hashCode => this._hashCode;

  //
  /// Mapping
  // --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---

  Map<String, dynamic> toJson() => _$TestModelToJson(this);

  factory TestModel.fromJson(Map<String, dynamic> json) =>
      _$TestModelFromJson(json);
}

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

  final List<String> listProp;

  bool get someGetter => false;

  @override
  String get getterA => 'value';
  static String staticMember = 'value';

  //
  /// Constructor
  // --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---

  CModel({String propA, String propB1, this.genericProp, this.listProp})
      : super(propA: propA, propB1: propB1, propB2: 'fixedValue');

  //
  /// Data class members
  // --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---

  CModel<T> rebuild(void Function(CModelBuilder<T>) updates) =>
      this._rebuild(updates);

  @override
  bool operator ==(other) => this._equals(other);

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
//  var model = TestModel();
//
//  var newModel = model.rebuild((TestModelBuilder builder) {
//    builder.name = '212323';
//  });
//
//  print(newModel.name);

  var model = CModel<String>();

  var newModel = model.rebuild((CModelBuilder<String> builder) {
    builder.genericProp = '123';
  });

  print(newModel.genericProp);
}
