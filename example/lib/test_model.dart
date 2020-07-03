import 'package:data_class/data_class.dart';
import 'package:json_annotation/json_annotation.dart';

part 'test_model.g.dart';

@JsonSerializable()
class InnerTestModel implements DataClass<InnerTestModel> {
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
  InnerTestModel rebuild(Function(DataClassBuilder<InnerTestModel>) updates) => _rebuild(updates);

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
class TestModel implements DataClass<TestModel> {
  //
  /// Properties
  // --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
  final String name;
  final int age;
  final List<String> list;
  final InnerTestModel innerTestModel;
//  final BuiltList <String> builtList;

  //
  /// Constructor
  // --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---

  TestModel({this.name, this.age, this.list, this.innerTestModel});

  //
  /// Data class members
  // --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---

  @override
  TestModel rebuild(Function(DataClassBuilder<TestModel>) updates) => _rebuild(updates);

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

//abstract class BaseModel{
//  final String baseString;
//
//  BaseModel(this.baseString);
//}
//
//@JsonSerializable()
//class ChildModel extends BaseModel implements DataClass<ChildModel> {
//  //
//  /// Properties
//  // --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
//  final String childString;
//
//  //
//  /// Constructor
//  // --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
//
//  ChildModel({String baseString, this.childString}) :super(baseString);
//
//  //
//  /// Data class members
//  // --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
//
//  @override
//  ChildModel rebuild(Function(DataClassBuilder<ChildModel>) updates) => _rebuild(updates);
//
//  @override
//  bool operator ==(other) => this._equals(other);
//
//  @override
//  String toString() => this._string;
//
//  @override
//  int get hashCode => this._hashCode;
//
//  //
//  /// Mapping
//  // --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
//
//  Map<String, dynamic> toJson() => _$ChildModelToJson(this);
//
//  factory ChildModel.fromJson(Map<String, dynamic> json) =>
//      _$ChildModelFromJson(json);
//}