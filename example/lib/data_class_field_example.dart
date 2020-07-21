import 'package:data_class/data_class.dart';

part 'data_class_field_example.g.dart';

class Value implements DataClass<Value, ValueBuilder> {
  final String prop1;

  @DataClassField(ignoreForBuilder: true)
  final String prop2;

  final String prop3;

  const Value({this.prop1, this.prop2, this.prop3});

  @override
  Value rebuild(void Function(ValueBuilder builder) updates) =>
      _rebuild(updates);

  @override
  ValueBuilder toBuilder() => _toBuilder();
}
