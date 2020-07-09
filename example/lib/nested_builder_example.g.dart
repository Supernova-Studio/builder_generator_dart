// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nested_builder_example.dart';

// **************************************************************************
// DataClassGenerator
// **************************************************************************

extension NodeDataClassDataClassExtension on NodeDataClass {
  NodeDataClass rebuild(void Function(NodeDataClassBuilder builder) updates) =>
      (toBuilder()..update(updates)).build();

  NodeDataClassBuilder toBuilder() => NodeDataClassBuilder()..replace(this);

  bool _equals(Object other) {
    if (identical(other, this)) return true;
    return other is NodeDataClass &&
        label == other.label &&
        left == other.left &&
        right == other.right &&
        values == other.values;
  }

  int get _hashCode {
    return $jf($jc(
        $jc($jc($jc(0, label.hashCode), left.hashCode), right.hashCode),
        values.hashCode));
  }

  String get _string {
    return (newDataClassToStringHelper('NodeDataClass')
          ..add('label', label)
          ..add('left', left)
          ..add('right', right)
          ..add('values', values))
        .toString();
  }
}

class NodeDataClassBuilder
    implements DataClassBuilder<NodeDataClass, NodeDataClassBuilder> {
  NodeDataClass _$v;

  String _label;
  String get label => _$this._label;
  set label(String label) => _$this._label = label;

  NodeDataClassBuilder _left;
  NodeDataClassBuilder get left => _$this._left ??= new NodeDataClassBuilder();
  set left(NodeDataClassBuilder left) => _$this._left = left;

  NodeDataClassBuilder _right;
  NodeDataClassBuilder get right =>
      _$this._right ??= new NodeDataClassBuilder();
  set right(NodeDataClassBuilder right) => _$this._right = right;

  ListBuilder<String> _values;
  ListBuilder<String> get values =>
      _$this._values ??= new ListBuilder<String>();
  set values(ListBuilder<String> values) => _$this._values = values;

  NodeDataClassBuilder();

  NodeDataClassBuilder get _$this {
    if (_$v != null) {
      _label = _$v.label;
      _left = _$v.left?.toBuilder();
      _right = _$v.right?.toBuilder();
      _values = _$v.values?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NodeDataClass other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other;
  }

  @override
  void update(void Function(NodeDataClassBuilder builder) updates) {
    if (updates != null) updates(this);
  }

  @override
  NodeDataClass build() {
    final _$result = _$v ??
        NodeDataClass(
            label: label,
            left: _left?.build(),
            right: _right?.build(),
            values: _values?.build());
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
