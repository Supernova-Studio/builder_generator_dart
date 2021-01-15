// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nested_data_class_example.dart';

// **************************************************************************
// DataClassGenerator
// **************************************************************************

extension NodeDataClassExtension on Node {
  Node _rebuild(void Function(NodeBuilder builder) updates) =>
      (_toBuilder()..update(updates)).build();

  NodeBuilder _toBuilder() => NodeBuilder._().._replace(this);

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
  Node _$Node$;

  String _label;
  String get label => _$this._label;
  set label(String label) => _$this._label = label;
  NodeBuilder _left;
  NodeBuilder get left => _$this._left;
  set left(NodeBuilder left) => _$this._left = left;
  NodeBuilder _right;
  NodeBuilder get right => _$this._right;
  set right(NodeBuilder right) => _$this._right = right;

  NodeBuilder._();

  NodeBuilder get _$this {
    if (_$Node$ != null) {
      _label = _$Node$.label;
      _left = _$Node$.left?.toBuilder();
      _right = _$Node$.right?.toBuilder();
      _$Node$ = null;
    }
    return this;
  }

  void _replace(covariant Node other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$Node$ = other;
  }

  @override
  void update(void Function(NodeBuilder builder) updates) {
    if (updates != null) updates(this);
  }

  @override
  Node build() {
    final _$result = _$Node$ ??
        Node(label: label, left: _left?.build(), right: _right?.build());
    _replace(_$result);
    return _$result;
  }
}

extension InnerModelDataClassExtension on InnerModel {
  InnerModel _rebuild(void Function(InnerModelBuilder builder) updates) =>
      (_toBuilder()..update(updates)).build();

  InnerModelBuilder _toBuilder() => InnerModelBuilder._().._replace(this);

  bool _equals(Object other) {
    if (identical(other, this)) return true;
    return other is InnerModel &&
        prop1 == other.prop1 &&
        prop2 == other.prop2 &&
        prop3 == other.prop3;
  }

  int get _hashCode {
    return $jf(
        $jc($jc($jc(0, prop1.hashCode), prop2.hashCode), prop3.hashCode));
  }

  String get _string {
    return (newDataClassToStringHelper('InnerModel')
          ..add('prop1', prop1)
          ..add('prop2', prop2)
          ..add('prop3', prop3))
        .toString();
  }
}

class InnerModelBuilder
    implements DataClassBuilder<InnerModel, InnerModelBuilder> {
  InnerModel _$InnerModel$;

  String _prop1;
  String get prop1 => _$this._prop1;
  set prop1(String prop1) => _$this._prop1 = prop1;
  String _prop2;
  String get prop2 => _$this._prop2;
  set prop2(String prop2) => _$this._prop2 = prop2;
  String _prop3;
  String get prop3 => _$this._prop3;
  set prop3(String prop3) => _$this._prop3 = prop3;

  InnerModelBuilder._();

  InnerModelBuilder get _$this {
    if (_$InnerModel$ != null) {
      _prop1 = _$InnerModel$.prop1;
      _prop2 = _$InnerModel$.prop2;
      _prop3 = _$InnerModel$.prop3;
      _$InnerModel$ = null;
    }
    return this;
  }

  void _replace(covariant InnerModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$InnerModel$ = other;
  }

  @override
  void update(void Function(InnerModelBuilder builder) updates) {
    if (updates != null) updates(this);
  }

  @override
  InnerModel build() {
    final _$result =
        _$InnerModel$ ?? InnerModel(prop1: prop1, prop2: prop2, prop3: prop3);
    _replace(_$result);
    return _$result;
  }
}

extension OuterModelDataClassExtension on OuterModel {
  OuterModel _rebuild(void Function(OuterModelBuilder builder) updates) =>
      (_toBuilder()..update(updates)).build();

  OuterModelBuilder _toBuilder() => OuterModelBuilder._().._replace(this);

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
  OuterModel _$OuterModel$;

  String _prop;
  String get prop => _$this._prop;
  set prop(String prop) => _$this._prop = prop;
  InnerModelBuilder _innerModel;
  InnerModelBuilder get innerModel => _$this._innerModel;
  set innerModel(InnerModelBuilder innerModel) =>
      _$this._innerModel = innerModel;

  OuterModelBuilder._();

  OuterModelBuilder get _$this {
    if (_$OuterModel$ != null) {
      _prop = _$OuterModel$.prop;
      _innerModel = _$OuterModel$.innerModel?.toBuilder();
      _$OuterModel$ = null;
    }
    return this;
  }

  void _replace(covariant OuterModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$OuterModel$ = other;
  }

  @override
  void update(void Function(OuterModelBuilder builder) updates) {
    if (updates != null) updates(this);
  }

  @override
  OuterModel build() {
    final _$result = _$OuterModel$ ??
        OuterModel(prop: prop, innerModel: _innerModel?.build());
    _replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
