/// For use by generated code in calculating hash codes. Do not use directly.
int $jc(int hash, int value) {
  // Jenkins hash "combine".
  hash = 0x1fffffff & (hash + value);
  hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
  return hash ^ (hash >> 6);
}

/// For use by generated code in calculating hash codes. Do not use directly.
int $jf(int hash) {
  // Jenkins hash "finish".
  hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
  hash = hash ^ (hash >> 11);
  return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
}

/// Function that returns a [DataClassToStringHelper].
typedef DataClassToStringHelperProvider = DataClassToStringHelper Function(
    String className);

/// Function used by generated code to get a [DataClassToStringHelper].
/// Set this to change data_class class toString() output. Built-in examples
/// are [IndentingDataClassToStringHelper], which is the default, and
/// [FlatDataClassToStringHelper].
DataClassToStringHelperProvider newDataClassToStringHelper =
    (String className) => IndentingDataClassToStringHelper(className);

/// Interface for data_class toString() output helpers.
///
/// Note: this is an experimental feature. API may change without a major
/// version increase.
abstract class DataClassToStringHelper {
  /// Add a field and its value.
  void add(String field, Object value);

  /// Returns to completed toString(). The helper may not be used after this
  /// method is called.
  @override
  String toString();
}

/// A [DataClassToStringHelper] that produces multi-line indented output.
class IndentingDataClassToStringHelper implements DataClassToStringHelper {
  StringBuffer _result = StringBuffer();

  IndentingDataClassToStringHelper(String className) {
    _result..write(className)..write(' {\n');
    _indentingDataClassToStringHelperIndent += 2;
  }

  @override
  void add(String field, Object value) {
    if (value != null) {
      _result
        ..write(' ' * _indentingDataClassToStringHelperIndent)
        ..write(field)
        ..write('=')
        ..write(value)
        ..write(',\n');
    }
  }

  @override
  String toString() {
    _indentingDataClassToStringHelperIndent -= 2;
    _result..write(' ' * _indentingDataClassToStringHelperIndent)..write('}');
    var stringResult = _result.toString();
    _result = null;
    return stringResult;
  }
}

int _indentingDataClassToStringHelperIndent = 0;

/// A [DataClassToStringHelper] that produces single line output.
class FlatDataClassToStringHelper implements DataClassToStringHelper {
  StringBuffer _result = StringBuffer();
  bool _previousField = false;

  FlatDataClassToStringHelper(String className) {
    _result..write(className)..write(' {');
  }

  @override
  void add(String field, Object value) {
    if (value != null) {
      if (_previousField) _result.write(',');
      _result..write(field)..write('=')..write(value);
      _previousField = true;
    }
  }

  @override
  String toString() {
    _result..write('}');
    var stringResult = _result.toString();
    _result = null;
    return stringResult;
  }
}
