// GENERATED CODE - DO NOT MODIFY BY HAND

part of data_class_generator.source_class;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ValueSourceClass extends ValueSourceClass {
  @override
  final ClassElement element;
  ParsedLibraryResult __parsedLibrary;
  String __name;
  String __builderName;
  String __extPartName;
  BuiltList<String> __genericParameters;
  BuiltList<String> __genericBounds;
  ClassDeclaration __classDeclaration;
  BuiltList<ValueSourceField> __fields;
  ConstructorElement __constructor;
  BuiltList<ValueSourceField> __ctorFields;
  String __source;
  String __partStatement;
  bool __hasPartStatement;
  bool __hasDataClassImportWithShow;
  bool __hasDataClassImportWithAs;
  bool __dataClassIsAbstract;
  BuiltList<String> __builderImplements;
  CompilationUnitElement __compilationUnit;

  factory _$ValueSourceClass(
          [void Function(ValueSourceClassBuilder) updates]) =>
      (new ValueSourceClassBuilder()..update(updates)).build();

  _$ValueSourceClass._({this.element}) : super._() {
    if (element == null) {
      throw new BuiltValueNullFieldError('ValueSourceClass', 'element');
    }
  }

  @override
  ParsedLibraryResult get parsedLibrary =>
      __parsedLibrary ??= super.parsedLibrary;

  @override
  String get name => __name ??= super.name;

  @override
  String get builderName => __builderName ??= super.builderName;

  @override
  BuiltList<String> get genericParameters =>
      __genericParameters ??= super.genericParameters;

  @override
  BuiltList<String> get genericBounds =>
      __genericBounds ??= super.genericBounds;

  @override
  ClassDeclaration get classDeclaration =>
      __classDeclaration ??= super.classDeclaration;

  @override
  BuiltList<ValueSourceField> get fields => __fields ??= super.fields;

  @override
  ConstructorElement get constructor => __constructor ??= super.constructor;

  @override
  BuiltList<ValueSourceField> get ctorFields =>
      __ctorFields ??= super.ctorFields;

  @override
  String get source => __source ??= super.source;

  @override
  String get partStatement => __partStatement ??= super.partStatement;

  @override
  bool get hasPartStatement => __hasPartStatement ??= super.hasPartStatement;

  @override
  bool get hasDataClassImportWithShow =>
      __hasDataClassImportWithShow ??= super.hasDataClassImportWithShow;

  @override
  bool get hasDataClassImportWithAs =>
      __hasDataClassImportWithAs ??= super.hasDataClassImportWithAs;

  @override
  bool get dataClassIsAbstract =>
      __dataClassIsAbstract ??= super.dataClassIsAbstract;

  @override
  BuiltList<String> get builderImplements =>
      __builderImplements ??= super.builderImplements;

  @override
  CompilationUnitElement get compilationUnit =>
      __compilationUnit ??= super.compilationUnit;

  @override
  ValueSourceClass rebuild(void Function(ValueSourceClassBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ValueSourceClassBuilder toBuilder() =>
      new ValueSourceClassBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ValueSourceClass && element == other.element;
  }

  @override
  int get hashCode {
    return $jf($jc(0, element.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ValueSourceClass')
          ..add('element', element))
        .toString();
  }
}

class ValueSourceClassBuilder
    implements Builder<ValueSourceClass, ValueSourceClassBuilder> {
  _$ValueSourceClass _$v;

  ClassElement _element;
  ClassElement get element => _$this._element;
  set element(ClassElement element) => _$this._element = element;

  ValueSourceClassBuilder();

  ValueSourceClassBuilder get _$this {
    if (_$v != null) {
      _element = _$v.element;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ValueSourceClass other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ValueSourceClass;
  }

  @override
  void update(void Function(ValueSourceClassBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ValueSourceClass build() {
    final _$result = _$v ?? new _$ValueSourceClass._(element: element);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
