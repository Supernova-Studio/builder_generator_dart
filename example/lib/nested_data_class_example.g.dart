// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nested_data_class_example.dart';

// **************************************************************************
// DataClassGenerator
// **************************************************************************

extension NodeDataClassExtension on Node {
  Node rebuild(void Function(NodeBuilder builder) updates) =>
      (toBuilder()..update(updates)).build();

  NodeBuilder toBuilder() => NodeBuilder()..replace(this);

  bool _equals(Object other) {
    if (identical(other, this)) return true;
    return other is Node &&
        label == other.label &&
        left == other.left &&
        right == other.right;
  }

  int get _hashCode {
    return $jf($jc($jc($jc(0, label.hashCode), left.hashCode), right.hashCode));
  }

  String get _string {
    return (newDataClassToStringHelper('Node')
          ..add('label', label)
          ..add('left', left)
          ..add('right', right))
        .toString();
  }
}

class NodeBuilder implements DataClassBuilder<Node, NodeBuilder> {
  Node _$v;

  String _label;
  String get label => _$this._label;
  set label(String label) => _$this._label = label;

  NodeBuilder _left;
  NodeBuilder get left => _$this._left ??= new NodeBuilder();
  set left(NodeBuilder left) => _$this._left = left;

  NodeBuilder _right;
  NodeBuilder get right => _$this._right ??= new NodeBuilder();
  set right(NodeBuilder right) => _$this._right = right;

  NodeBuilder();

  NodeBuilder get _$this {
    if (_$v != null) {
      _label = _$v.label;
      _left = _$v.left?.toBuilder();
      _right = _$v.right?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Node other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other;
  }

  @override
  void update(void Function(NodeBuilder builder) updates) {
    if (updates != null) updates(this);
  }

  @override
  Node build() {
    final _$result =
        _$v ?? Node(label: label, left: _left?.build(), right: _right?.build());
    replace(_$result);
    return _$result;
  }
}

extension InnerModelDataClassExtension on InnerModel {
  InnerModel rebuild(void Function(InnerModelBuilder builder) updates) =>
      (toBuilder()..update(updates)).build();

  InnerModelBuilder toBuilder() => InnerModelBuilder()..replace(this);

  bool _equals(Object other) {
    if (identical(other, this)) return true;
    return other is InnerModel && prop == other.prop;
  }

  int get _hashCode {
    return $jf($jc(0, prop.hashCode));
  }

  String get _string {
    return (newDataClassToStringHelper('InnerModel')..add('prop', prop))
        .toString();
  }
}

class InnerModelBuilder
    implements DataClassBuilder<InnerModel, InnerModelBuilder> {
  InnerModel _$v;

  String _prop;
  String get prop => _$this._prop;
  set prop(String prop) => _$this._prop = prop;

  InnerModelBuilder();

  InnerModelBuilder get _$this {
    if (_$v != null) {
      _prop = _$v.prop;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(InnerModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other;
  }

  @override
  void update(void Function(InnerModelBuilder builder) updates) {
    if (updates != null) updates(this);
  }

  @override
  InnerModel build() {
    final _$result = _$v ?? InnerModel(prop: prop);
    replace(_$result);
    return _$result;
  }
}

extension OuterModelDataClassExtension on OuterModel {
  OuterModel rebuild(void Function(OuterModelBuilder builder) updates) =>
      (toBuilder()..update(updates)).build();

  OuterModelBuilder toBuilder() => OuterModelBuilder()..replace(this);

  bool _equals(Object other) {
    if (identical(other, this)) return true;
    return other is OuterModel &&
        prop == other.prop &&
        innerModel == other.innerModel;
  }

  int get _hashCode {
    return $jf($jc($jc(0, prop.hashCode), innerModel.hashCode));
  }

  String get _string {
    return (newDataClassToStringHelper('OuterModel')
          ..add('prop', prop)
          ..add('innerModel', innerModel))
        .toString();
  }
}

class OuterModelBuilder
    implements DataClassBuilder<OuterModel, OuterModelBuilder> {
  OuterModel _$v;

  String _prop;
  String get prop => _$this._prop;
  set prop(String prop) => _$this._prop = prop;

  InnerModelBuilder _innerModel;
  InnerModelBuilder get innerModel =>
      _$this._innerModel ??= new InnerModelBuilder();
  set innerModel(InnerModelBuilder innerModel) =>
      _$this._innerModel = innerModel;

  OuterModelBuilder();

  OuterModelBuilder get _$this {
    if (_$v != null) {
      _prop = _$v.prop;
      _innerModel = _$v.innerModel?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OuterModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other;
  }

  @override
  void update(void Function(OuterModelBuilder builder) updates) {
    if (updates != null) updates(this);
  }

  @override
  OuterModel build() {
    final _$result =
        _$v ?? OuterModel(prop: prop, innerModel: _innerModel?.build());
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
