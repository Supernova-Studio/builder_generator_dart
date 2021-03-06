// GENERATED CODE - DO NOT MODIFY BY HAND

part of data_class_generator.source_field;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ValueSourceField extends ValueSourceField {
  @override
  final ParsedLibraryResult parsedLibrary;
  @override
  final FieldElement element;
  String __name;
  DataClassField __settings;
  String __type;
  bool __isFunctionType;
  String __typeWithPrefix;
  bool __isGetter;
  bool __isNullable;
  bool __isNestedBuilder;

  factory _$ValueSourceField(
          [void Function(ValueSourceFieldBuilder) updates]) =>
      (new ValueSourceFieldBuilder()..update(updates)).build();

  _$ValueSourceField._({this.parsedLibrary, this.element}) : super._() {
    if (parsedLibrary == null) {
      throw new BuiltValueNullFieldError('ValueSourceField', 'parsedLibrary');
    }
    if (element == null) {
      throw new BuiltValueNullFieldError('ValueSourceField', 'element');
    }
  }

  @override
  String get name => __name ??= super.name;

  @override
  DataClassField get settings => __settings ??= super.settings;

  @override
  String get type => __type ??= super.type;

  @override
  bool get isFunctionType => __isFunctionType ??= super.isFunctionType;

  @override
  String get typeWithPrefix => __typeWithPrefix ??= super.typeWithPrefix;

  @override
  bool get isGetter => __isGetter ??= super.isGetter;

  @override
  bool get isNullable => __isNullable ??= super.isNullable;

  @override
  bool get isNestedBuilder => __isNestedBuilder ??= super.isNestedBuilder;

  @override
  ValueSourceField rebuild(void Function(ValueSourceFieldBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ValueSourceFieldBuilder toBuilder() =>
      new ValueSourceFieldBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ValueSourceField &&
        parsedLibrary == other.parsedLibrary &&
        element == other.element;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, parsedLibrary.hashCode), element.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ValueSourceField')
          ..add('parsedLibrary', parsedLibrary)
          ..add('element', element))
        .toString();
  }
}

class ValueSourceFieldBuilder
    implements Builder<ValueSourceField, ValueSourceFieldBuilder> {
  _$ValueSourceField _$v;

  ParsedLibraryResult _parsedLibrary;
  ParsedLibraryResult get parsedLibrary => _$this._parsedLibrary;
  set parsedLibrary(ParsedLibraryResult parsedLibrary) =>
      _$this._parsedLibrary = parsedLibrary;

  FieldElement _element;
  FieldElement get element => _$this._element;
  set element(FieldElement element) => _$this._element = element;

  ValueSourceFieldBuilder();

  ValueSourceFieldBuilder get _$this {
    if (_$v != null) {
      _parsedLibrary = _$v.parsedLibrary;
      _element = _$v.element;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ValueSourceField other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ValueSourceField;
  }

  @override
  void update(void Function(ValueSourceFieldBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ValueSourceField build() {
    final _$result = _$v ??
        new _$ValueSourceField._(
            parsedLibrary: parsedLibrary, element: element);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
