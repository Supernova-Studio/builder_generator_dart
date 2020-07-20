import 'package:built_collection/built_collection.dart';
import 'package:data_class/data_class.dart';
import 'package:example/built_collection_example.dart';

part 'generic_example.g.dart';

class Model<T, S> implements DataClass<Model<T, S>, ModelBuilder<T, S>> {
  final T prop1;
  final BuiltList<S> prop2;
  final String prop3;

  const Model({this.prop1, this.prop2, this.prop3});

  @override
  bool operator ==(dynamic other) => _equals(other);

  @override
  String toString() => _string;

  @override
  int get hashCode => _hashCode;

  @override
  Model<T, S> rebuild(void Function(ModelBuilder<T, S>) updates) => _rebuild(updates);

  @override
  ModelBuilder<T, S> toBuilder() => _toBuilder();
}
