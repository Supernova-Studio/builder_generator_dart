/// Implement this for a Data Class.
///
/// Then use data_class_generator.dart code generation functionality to
/// provide the rest of the implementation.
abstract class DataClass<V extends DataClass<V, B>,
    B extends DataClassBuilder<V, B>> {
  // Prevent usage as a mixin or as a parent
  DataClass._();

  /// Rebuilds the instance.
  ///
  /// The result is the same as this instance but with [updates] applied.
  /// [updates] is a function that takes a builder [B].
  ///
  /// The implementation of this method will be generated for you by the
  /// data_class generator.
  V rebuild(void Function(B builder) updates);

  /// Converts the instance to a builder [B].
  ///
  /// The implementation of this method will be generated for you by the
  /// data_class generator.
  B toBuilder();
}

/// Every [DataClass] class has a corresponding [DataClassBuilder] class.
///
/// You don't need to create one by hand; it will be generated
/// for you.
abstract class DataClassBuilder<V, B extends DataClassBuilder<V, B>> {
  /// Replaces the value in the builder with a new one.
  ///
  /// The implementation of this method will be generated for you by the
  /// data_class generator.
  void replace(covariant V value);

  /// Applies updates.
  ///
  /// [updates] is a function that takes a builder [B].
  void update(Function(B builder) updates);

  /// Builds a data class.
  ///
  /// The implementation of this method will be generated for you by the
  /// data_class generator.
  V build();
}
