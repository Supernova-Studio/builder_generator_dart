import 'package:data_class/data_class.dart';
import 'package:json_annotation/json_annotation.dart';

part 'test_model.g.dart';

@JsonSerializable()
class InnerTestModel
    implements DataClass<InnerTestModel, InnerTestModelBuilder> {
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
class TestModel implements DataClass<TestModel, TestModelBuilder> {
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

class AModel {
  final String propA;

  AModel({this.propA});
}

abstract class BModel extends AModel {
  final String propB1;
  final String propB2;

  BModel({this.propB1, this.propB2, String propA}) : super(propA: propA);
}

@JsonSerializable()
class CModel<T> extends BModel
    implements DataClass<CModel<T>, CModelBuilder<T>> {
  //
  /// Properties
  // --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
  @JsonKey(ignore: true)
  final T genericProp;

  bool get someGetter => false;
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
