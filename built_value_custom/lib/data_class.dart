import 'built_value.dart';

abstract class DataClass<T> {
  T rebuild(Function(DataClassBuilder<T> builder) updates);
}
