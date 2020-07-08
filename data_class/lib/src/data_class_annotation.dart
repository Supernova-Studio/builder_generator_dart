class DataClass {
  const DataClass();
}

/// Every [DataClass] class has a corresponding [DataClassBuilder] class.
///
/// Usually you don't need to create one by hand; it will be generated
/// for you.
abstract class DataClassBuilder<V, B extends DataClassBuilder<V, B>> {
  /// Replaces the value in the builder with a new one.
  ///
  /// The implementation of this method will be generated for you by the
  /// data_class generator.
  void replace(V value);

  /// Applies updates.
  ///
  /// [updates] is a function that takes a builder [B].
  void update(Function(B) updates);

  /// Builds.
  ///
  /// The implementation of this method will be generated for you by the
  /// data_class generator.
  V build();
}
