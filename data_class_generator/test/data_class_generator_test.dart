// Copyright (c) 2015, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:async';

import 'package:build/build.dart';
import 'package:build_test/build_test.dart';
import 'package:data_class_generator/data_class_generator.dart';
import 'package:test/test.dart';
import 'package:logging/logging.dart';
import 'package:source_gen/source_gen.dart';

void main() {
  group('Valid input', () {
    test('Generator works correctly with a model with a single property',
        () async {
      expect(
        await generate('''library data_class;
import 'package:data_class/data_class.dart';
part 'value.g.dart';

@DataClass()
class Value {
  final String name;
  
  Value({this.name});

  @override
  Value rebuild(Function(DataClassBuilder<Value>) updates) => _rebuild(updates);

  @override
  bool operator ==(other) => _equals(other);

  @override
  String toString() => _string;

  @override
  int get hashCode => _hashCode;
}'''),
        isNot(containsErrors),
      );
    });

    test('Generator works correctly with an inherited data class', () async {
      expect(
        await generate('''library data_class;
import 'package:data_class/data_class.dart';
part 'value.g.dart';

abstract class AModel {
  final String propA;

  AModel({this.propA});
}

abstract class BModel extends AModel {
  final String propB;

  BModel({this.propB, String propA}) : super(propA: propA);
}

@DataClass()
class CModel extends BModel {
  final String propC;

  CModel({String propA, String propB, this.propC})
      : super(propA: propA, propB: propB);

  @override
  CModel rebuild(void Function(CModelBuilder) updates) =>
      this._rebuild(updates);

  @override
  bool operator ==(other) => this._equals(other);

  @override
  String toString() => this._string;

  @override
  int get hashCode => this._hashCode;
}'''),
        isNot(containsErrors),
      );
    });

    test('Generic data class is supported', () async {
      expect(
        await generate('''library data_class;
import 'package:data_class/data_class.dart';
part 'value.g.dart';

@DataClass()
class CModel<T> {

  final T genericProp;

  CModel({this.genericProp});

  @override
  CModel<T> rebuild(void Function(CModelBuilder<T>) updates) =>
      this._rebuild(updates);

  @override
  bool operator ==(other) => this._equals(other);

  @override
  String toString() => this._string;

  @override
  int get hashCode => this._hashCode;
}'''),
        isNot(containsErrors),
      );
    });
  });

  group('Invalid input', () {
    test('Non-final field is checked', () async {
      expect(
        await generate('''library data_class;
import 'package:data_class/data_class.dart';
part 'value.g.dart';

mixin SomeMixin{
  int mixinProp;
}

@DataClass()
class CModel with SomeMixin {

  final String prop1;
  String prop2;

  CModel({this.prop1});

  @override
  CModel rebuild(void Function(CModelBuilder) updates) =>
      this._rebuild(updates);

  @override
  bool operator ==(other) => this._equals(other);

  @override
  String toString() => this._string;

  @override
  int get hashCode => this._hashCode;
}'''),
        contains(
            '1. Data class fields must be final. However, these fields are not final: prop2, mixinProp'),
      );
    });

    test('Missing default constructor is checked', () async {
      expect(
        await generate('''library data_class;
import 'package:data_class/data_class.dart';
part 'value.g.dart';

@DataClass()
class CModel {

  final String prop1;

  CModel.custom({this.prop1});
}'''),
        contains(
            '1. Default constructor is not found. Please, add CModel() with all required parameters.'),
      );
    });

    test('Abstract class is checked', () async {
      expect(
        await generate('''library data_class;
import 'package:data_class/data_class.dart';
part 'value.g.dart';

@DataClass()
abstract class CModel {

  final String prop1;

  CModel({this.prop1});
}'''),
        contains('1. Class is abstract. Make it instantiable.'),
      );
    });

    test('Rejects import with show', () async {
      expect(
          await generate('''library data_class;
import 'package:data_class/data_class.dart' show DataClass, DataClassBuilder;
part 'value.g.dart';

@DataClass()
class Value {
  Value();
}'''),
          contains('1. Stop using "show" when importing '
              '"package:data_class/data_class.dart".'));
    });
  });

//  group('generator', () {
//
//
//    test('rejects double quoted import with "show"', () async {
//      expect(
//          await generate('''library data_class;
//import "package:data_class/data_class.dart" show Built, Builder;
//part 'value.g.dart';
//abstract class Value implements Built<Value, ValueBuilder> {
//  Value._();
//  factory Value([void Function(ValueBuilder) updates]) = _\$Value;
//}
//abstract class ValueBuilder implements Builder<Value, ValueBuilder> {
//  ValueBuilder._();
//  factory ValueBuilder() = _\$ValueBuilder;
//}'''),
//          contains('1. Stop using "show" when importing '
//              '"package:data_class/data_class.dart".'));
//    });
//
//    test('rejects import with "as"', () async {
//      expect(
//          await generate('''library data_class;
//import 'package:data_class/data_class.dart' as bv;
//part 'value.g.dart';
//abstract class Value implements bv.Built<Value, ValueBuilder> {
//  Value._();
//  factory Value([void Function(ValueBuilder) updates]) = _\$Value;
//}
//abstract class ValueBuilder implements bv.Builder<Value, ValueBuilder> {
//  ValueBuilder._();
//  factory ValueBuilder() = _\$ValueBuilder;
//}'''),
//          contains('1. Stop using "as" when importing '
//              '"package:data_class/data_class.dart".'));
//    });
//
//    test('rejects double quoted import with "as"', () async {
//      expect(
//          await generate('''library data_class;
//import "package:data_class/data_class.dart" as bv;
//part 'value.g.dart';
//abstract class Value implements bv.Built<Value, ValueBuilder> {
//  Value._();
//  factory Value([void Function(ValueBuilder) updates]) = _\$Value;
//}
//abstract class ValueBuilder implements bv.Builder<Value, ValueBuilder> {
//  ValueBuilder._();
//  factory ValueBuilder() = _\$ValueBuilder;
//}'''),
//          contains('1. Stop using "as" when importing '
//              '"package:data_class/data_class.dart".'));
//    });
//
//    test('suggests to import part file', () async {
//      expect(await generate('''library data_class;
//
//abstract class Value implements Built<Value, ValueBuilder> {
//  Value._();
//  factory Value([void Function(ValueBuilder) updates]) = _\$Value;
//}
//abstract class ValueBuilder implements Builder<Value, ValueBuilder> {
//  ValueBuilder._();
//  factory ValueBuilder() = _\$ValueBuilder;
//}'''), contains("1. Import generated part: part 'value.g.dart';"));
//    });
//
//    test('suggests to make value class abstract', () async {
//      expect(await generate('''library data_class;
//
//part 'value.g.dart';
//class Value implements Built<Value, ValueBuilder> {
//  Value._();
//  factory Value([void Function(ValueBuilder) updates]) = _\$Value;
//}
//abstract class ValueBuilder implements Builder<Value, ValueBuilder> {
//  ValueBuilder._();
//  factory ValueBuilder() = _\$ValueBuilder;
//}'''), contains('1. Make class abstract.'));
//    });
//
//    test('suggests correct Built type parameters for implements', () async {
//      expect(await generate('''library data_class;
//
//part 'value.g.dart';
//abstract class Value implements Built<Foo, Bar> {
//  Value._();
//  factory Value([void Function(ValueBuilder) updates]) = _\$Value;
//}
//abstract class ValueBuilder implements Builder<Value, ValueBuilder> {
//  ValueBuilder._();
//  factory ValueBuilder() = _\$ValueBuilder;
//}'''), contains('1. Make class implement Built<Value, ValueBuilder>.'));
//    });
//
//    test('rejects "extends" with concrete base', () async {
//      expect(
//          await generate('''library data_class;
//
//part 'value.g.dart';
//class Foo {}
//abstract class Value implements Built<Value, ValueBuilder> extends Foo {
//  Value._();
//  factory Value([void Function(ValueBuilder) updates]) = _\$Value;
//}
//abstract class ValueBuilder implements Builder<Value, ValueBuilder> {
//  ValueBuilder._();
//  factory ValueBuilder() = _\$ValueBuilder;
//}'''),
//          contains('1. Stop class extending other classes. '
//              'Only "implements" and "extends Object with" are allowed.'));
//    });
//
//    test('rejects "extends" with base with fields', () async {
//      expect(
//          await generate('''library data_class;
//
//part 'value.g.dart';
//abstract class Foo {
//  final int x;
//}
//abstract class Value implements Built<Value, ValueBuilder> extends Foo {
//  Value._();
//  factory Value([void Function(ValueBuilder) updates]) = _\$Value;
//}
//abstract class ValueBuilder implements Builder<Value, ValueBuilder> {
//  ValueBuilder._();
//  factory ValueBuilder() = _\$ValueBuilder;
//}'''),
//          contains('1. Stop class extending other classes. '
//              'Only "implements" and "extends Object with" are allowed.'));
//    });
//
//    test('rejects "extends" with base with abstract getter', () async {
//      expect(
//          await generate('''library data_class;
//
//part 'value.g.dart';
//abstract class Foo {
//  int get x;
//}
//abstract class Value implements Built<Value, ValueBuilder> extends Foo {
//  Value._();
//  factory Value([void Function(ValueBuilder) updates]) = _\$Value;
//}
//abstract class ValueBuilder implements Builder<Value, ValueBuilder> {
//  ValueBuilder._();
//  factory ValueBuilder() = _\$ValueBuilder;
//}'''),
//          contains('1. Stop class extending other classes. '
//              'Only "implements" and "extends Object with" are allowed.'));
//    });
//
//    test('rejects "extends" with base with operator==', () async {
//      expect(
//          await generate('''library data_class;
//
//part 'value.g.dart';
//abstract class Foo {
//  bool get operator==(other) => true;
//}
//abstract class Value implements Built<Value, ValueBuilder> extends Foo {
//  Value._();
//  factory Value([void Function(ValueBuilder) updates]) = _\$Value;
//}
//abstract class ValueBuilder implements Builder<Value, ValueBuilder> {
//  ValueBuilder._();
//  factory ValueBuilder() = _\$ValueBuilder;
//}'''),
//          contains('1. Stop class extending other classes. '
//              'Only "implements" and "extends Object with" are allowed.'));
//    });
//
//    test(
//        'allows "extends" with base with abstract and concrete methods '
//        'and concrete getters', () async {
//      expect(await generate('''library data_class;
//
//part 'value.g.dart';
//abstract class Foo {
//  int foo();
//  int bar() => 3;
//  int get baz => foo();
//}
//abstract class Value implements Built<Value, ValueBuilder> extends Foo {
//  Value._();
//  factory Value([void Function(ValueBuilder) updates]) = _\$Value;
//}
//abstract class ValueBuilder implements Builder<Value, ValueBuilder> {
//  ValueBuilder._();
//  factory ValueBuilder() = _\$ValueBuilder;
//}'''), isNot(contains('1.')));
//    });
//
//    test('rejects "extends Built"', () async {
//      expect(await generate('''library data_class;
//
//part 'value.g.dart';
//abstract class Value extends Built<Value, ValueBuilder> {
//  Value._();
//  factory Value([void Function(ValueBuilder) updates]) = _\$Value;
//}
//abstract class ValueBuilder implements Builder<Value, ValueBuilder> {
//  ValueBuilder._();
//  factory ValueBuilder() = _\$ValueBuilder;
//}'''), allOf(contains('Make class implement Built<Value, ValueBuilder>.')));
//    });
//
//    test('works with multiple implements', () async {
//      expect(await generate('''library data_class;
//
//part 'value.g.dart';
//abstract class Value implements Built<Value, ValueBuilder>, Object {
//  Value._();
//  factory Value([void Function(ValueBuilder) updates]) = _\$Value;
//}'''), isNot(contains('1.')));
//    });
//
//    test('allows updates to have return type', () async {
//      expect(await generate('''library data_class;
//
//part 'value.g.dart';
//abstract class Value implements Built<Value, ValueBuilder>, Object {
//  Value._();
//  factory Value([void Function(ValueBuilder) updates]) = _\$Value;
//}'''), isNot(contains('1.')));
//    });
//
//    test('handles unresolved Built type parameters', () async {
//      expect(await generate('''library data_class;
//
//part 'value.g.dart';
//abstract class Value implements Built<Value, ValueBuilder> {
//  Value._();
//  factory Value([void Function(ValueBuilder) updates]) = _\$Value;
//}'''), isNot(contains('1.')));
//    });
//
//    test('suggests making builder initializer static', () async {
//      expect(
//          await generate('''library data_class;
//
//part 'value.g.dart';
//abstract class Value implements Built<Value, ValueBuilder> {
//  void _initializeBuilder(ValueBuilder b) {}
//  Value._();
//  factory Value([void Function(ValueBuilder) updates]) = _\$Value;
//}
//abstract class ValueBuilder implements Builder<Value, ValueBuilder> {
//  ValueBuilder._();
//  factory ValueBuilder() = _\$ValueBuilder;
//}'''),
//          contains('1. Fix _initializeBuilder signature: '
//              'static void _initializeBuilder(ValueBuilder b)'));
//    });
//
//    test('suggests making builder initializer return void', () async {
//      expect(
//          await generate('''library data_class;
//
//part 'value.g.dart';
//abstract class Value implements Built<Value, ValueBuilder> {
//  static String _initializeBuilder(ValueBuilder b) {}
//  Value._();
//  factory Value([void Function(ValueBuilder) updates]) = _\$Value;
//}
//abstract class ValueBuilder implements Builder<Value, ValueBuilder> {
//  ValueBuilder._();
//  factory ValueBuilder() = _\$ValueBuilder;
//}'''),
//          contains('1. Fix _initializeBuilder signature: '
//              'static void _initializeBuilder(ValueBuilder b)'));
//    });
//
//    test('suggests making builder initializer accept a builder', () async {
//      expect(
//          await generate('''library data_class;
//
//part 'value.g.dart';
//abstract class Value implements Built<Value, ValueBuilder> {
//  static void _initializeBuilder(String b) {}
//  Value._();
//  factory Value([void Function(ValueBuilder) updates]) = _\$Value;
//}
//abstract class ValueBuilder implements Builder<Value, ValueBuilder> {
//  ValueBuilder._();
//  factory ValueBuilder() = _\$ValueBuilder;
//}'''),
//          contains('1. Fix _initializeBuilder signature: '
//              'static void _initializeBuilder(ValueBuilder b)'));
//    });
//
//    test('suggests making builder finalizer static', () async {
//      expect(
//          await generate('''library data_class;
//
//part 'value.g.dart';
//abstract class Value implements Built<Value, ValueBuilder> {
//  void _finalizeBuilder(ValueBuilder b) {}
//  Value._();
//  factory Value([void Function(ValueBuilder) updates]) = _\$Value;
//}
//abstract class ValueBuilder implements Builder<Value, ValueBuilder> {
//  ValueBuilder._();
//  factory ValueBuilder() = _\$ValueBuilder;
//}'''),
//          contains('1. Fix _finalizeBuilder signature: '
//              'static void _finalizeBuilder(ValueBuilder b)'));
//    });
//
//    test('suggests making builder finalizer return void', () async {
//      expect(
//          await generate('''library data_class;
//
//part 'value.g.dart';
//abstract class Value implements Built<Value, ValueBuilder> {
//  static String _finalizeBuilder(ValueBuilder b) {}
//  Value._();
//  factory Value([void Function(ValueBuilder) updates]) = _\$Value;
//}
//abstract class ValueBuilder implements Builder<Value, ValueBuilder> {
//  ValueBuilder._();
//  factory ValueBuilder() = _\$ValueBuilder;
//}'''),
//          contains('1. Fix _finalizeBuilder signature: '
//              'static void _finalizeBuilder(ValueBuilder b)'));
//    });
//
//    test('suggests making builder finalizer accept a builder', () async {
//      expect(
//          await generate('''library data_class;
//
//part 'value.g.dart';
//abstract class Value implements Built<Value, ValueBuilder> {
//  static void _finalizeBuilder(String b) {}
//  Value._();
//  factory Value([void Function(ValueBuilder) updates]) = _\$Value;
//}
//abstract class ValueBuilder implements Builder<Value, ValueBuilder> {
//  ValueBuilder._();
//  factory ValueBuilder() = _\$ValueBuilder;
//}'''),
//          contains('1. Fix _finalizeBuilder signature: '
//              'static void _finalizeBuilder(ValueBuilder b)'));
//    });
//
//    test('suggests to add constructor to value class', () async {
//      expect(await generate('''library data_class;
//
//part 'value.g.dart';
//abstract class Value implements Built<Value, ValueBuilder> {
//  factory Value([void Function(ValueBuilder) updates]) = _\$Value;
//}
//abstract class ValueBuilder implements Builder<Value, ValueBuilder> {
//  ValueBuilder._();
//  factory ValueBuilder() = _\$ValueBuilder;
//}'''), contains('1. Make class have exactly one constructor: Value._();'));
//    });
//
//    test('suggests to add constructor when there is synthetic constructor',
//        () async {
//      expect(await generate('''library data_class;
//
//part 'value.g.dart';
//abstract class Value implements Built<Value, ValueBuilder> {
//}
//abstract class ValueBuilder implements Builder<Value, ValueBuilder> {
//  ValueBuilder._();
//  factory ValueBuilder() = _\$ValueBuilder;
//}'''), contains('1. Make class have exactly one constructor: Value._();'));
//    });
//
//    test('allows code in constructor of value class', () async {
//      expect(
//          await generate('''library data_class;
//
//part 'value.g.dart';
//abstract class Value implements Built<Value, ValueBuilder> {
//  Value._() {
//    print("hi");
//  }
//  factory Value([void Function(ValueBuilder) updates]) = _\$Value;
//}
//abstract class ValueBuilder implements Builder<Value, ValueBuilder> {
//  ValueBuilder._();
//  factory ValueBuilder() = _\$ValueBuilder;
//}'''),
//          isNot(contains(
//              '1. Make class have exactly one constructor: Value._();')));
//    });
//
//    test('suggests to remove constructor from non-instantiable value class',
//        () async {
//      expect(await generate('''library data_class;
//
//part 'value.g.dart';
//@BuiltValue(instantiable: false)
//abstract class Value implements Built<Value, ValueBuilder> {
//  Value() {}
//  factory Value([void Function(ValueBuilder) updates]) = _\$Value;
//}
//abstract class ValueBuilder implements Builder<Value, ValueBuilder> {
//  ValueBuilder._();
//  factory ValueBuilder() = _\$ValueBuilder;
//}'''), contains('1. Remove all constructors or remove "instantiable: false".'));
//    });
//
//    test('suggests to add factory to value class', () async {
//      expect(
//          await generate('''library data_class;
//
//part 'value.g.dart';
//abstract class Value implements Built<Value, ValueBuilder> {
//  Value._();
//}
//abstract class ValueBuilder implements Builder<Value, ValueBuilder> {
//  ValueBuilder._();
//  factory ValueBuilder() = _\$ValueBuilder;
//}'''),
//          contains(
//              '1. Add a factory so your class can be instantiated. Example:\n'
//              '\n'
//              'factory Value([void Function(ValueBuilder) updates]) = _\$Value;'));
//    });
//
//    test('suggests to remove factory from non-instantiable value class',
//        () async {
//      expect(await generate('''library data_class;
//
//part 'value.g.dart';
//@BuiltValue(instantiable: false)
//abstract class Value implements Built<Value, ValueBuilder> {
//  factory Value([void Function(ValueBuilder) updates]) = _\$Value;
//}
//abstract class ValueBuilder implements Builder<Value, ValueBuilder> {
//  ValueBuilder._();
//  factory ValueBuilder() = _\$ValueBuilder;
//}'''), contains('1. Remove all factories or remove "instantiable: false".'));
//    });
//
//    test('suggests to make builder class abstract', () async {
//      expect(await generate('''library data_class;
//
//part 'value.g.dart';
//abstract class Value implements Built<Value, ValueBuilder> {
//  Value._();
//  factory Value([void Function(ValueBuilder) updates]) = _\$Value;
//}
//class ValueBuilder implements Builder<Value, ValueBuilder> {
//  ValueBuilder._();
//  factory ValueBuilder() = _\$ValueBuilder;
//}'''), contains('1. Make builder class abstract'));
//    });
//
//    test('suggests correct Builder type parameters', () async {
//      expect(
//          await generate('''library data_class;
//
//part 'value.g.dart';
//abstract class Value implements Built<Value, ValueBuilder> {
//  Value._();
//  factory Value([void Function(ValueBuilder) updates]) = _\$Value;
//}
//abstract class ValueBuilder implements Builder<Foo, Bar> {
//  ValueBuilder._();
//  factory ValueBuilder() = _\$ValueBuilder;
//}'''),
//          contains(
//              '1. Make builder class implement Builder<Value, ValueBuilder>. '
//              'Currently: Builder<dynamic, dynamic>'));
//    });
//
//    test('suggests to add constructor to builder class', () async {
//      expect(
//          await generate('''library data_class;
//
//part 'value.g.dart';
//abstract class Value implements Built<Value, ValueBuilder> {
//  Value._();
//  factory Value([void Function(ValueBuilder) updates]) = _\$Value;
//}
//abstract class ValueBuilder implements Builder<Value, ValueBuilder> {
//  factory ValueBuilder() = _\$ValueBuilder;
//}'''),
//          contains('1. Make builder class '
//              'have exactly one constructor: ValueBuilder._();'));
//    });
//
//    test('suggests constructor for builder class with synthetic constructor',
//        () async {
//      expect(
//          await generate('''library data_class;
//
//part 'value.g.dart';
//abstract class Value implements Built<Value, ValueBuilder> {
//  Value._();
//  factory Value([void Function(ValueBuilder) updates]) = _\$Value;
//}
//abstract class ValueBuilder implements Builder<Value, ValueBuilder> {
//}'''),
//          contains('1. Make builder class '
//              'have exactly one constructor: ValueBuilder._();'));
//    });
//
//    test('suggests to add factory to builder class', () async {
//      expect(
//          await generate('''library data_class;
//
//part 'value.g.dart';
//abstract class Value implements Built<Value, ValueBuilder> {
//  Value._();
//  factory Value([void Function(ValueBuilder) updates]) = _\$Value;
//}
//abstract class ValueBuilder implements Builder<Value, ValueBuilder> {
//  ValueBuilder._();
//}'''),
//          contains('1. Make builder class have exactly one factory: '
//              'factory ValueBuilder() = _\$ValueBuilder;'));
//    });
//
//    test('suggests value fields must be getters', () async {
//      expect(await generate('''library data_class;
//
//part 'value.g.dart';
//abstract class Value implements Built<Value, ValueBuilder> {
//  Value._();
//  factory Value([void Function(ValueBuilder) updates]) = _\$Value;
//  int foo;
//}
//abstract class ValueBuilder implements Builder<Value, ValueBuilder> {
//  ValueBuilder._();
//  factory ValueBuilder() = _\$ValueBuilder;
//  int foo;
//}'''), contains('1. Make field foo a getter.'));
//    });
//
//    test('suggests value fields must be public', () async {
//      expect(await generate('''library data_class;
//
//part 'value.g.dart';
//abstract class Value implements Built<Value, ValueBuilder> {
//  Value._();
//  int get _foo;
//  factory Value([void Function(ValueBuilder) updates]) = _\$Value;
//}'''), contains('1. Make field _foo public; remove the underscore.'));
//    });
//
//    test('rejects dynamic fields', () async {
//      expect(
//          await generate('''library data_class;
//
//part 'value.g.dart';
//abstract class Value implements Built<Value, ValueBuilder> {
//  Value._();
//  factory Value([void Function(ValueBuilder) updates]) = _\$Value;
//  get foo;
//}'''),
//          contains('1. Make field foo have non-dynamic type. If you are '
//              'already specifying a type, please make sure the type is correctly imported.'));
//    });
//
//    test('suggests builder fields must be normal fields', () async {
//      expect(
//          await generate('''library data_class;
//
//part 'value.g.dart';
//abstract class Value implements Built<Value, ValueBuilder> {
//  Value._();
//  factory Value([void Function(ValueBuilder) updates]) = _\$Value;
//  int get foo;
//}
//abstract class ValueBuilder implements Builder<Value, ValueBuilder> {
//  ValueBuilder._();
//  factory ValueBuilder() = _\$ValueBuilder;
//  int get foo;
//}'''),
//          contains('1. Make builder field foo a normal field or a '
//              'getter/setter pair.'));
//    });
//
//    test('suggests builder fields must be in sync', () async {
//      expect(await generate('''library data_class;
//
//part 'value.g.dart';
//abstract class Value implements Built<Value, ValueBuilder> {
//  Value._();
//  factory Value([void Function(ValueBuilder) updates]) = _\$Value;
//  int get foo;
//}
//abstract class ValueBuilder implements Builder<Value, ValueBuilder> {
//  ValueBuilder._();
//  factory ValueBuilder() = _\$ValueBuilder;
//}'''), contains('1. Make builder have exactly these fields: foo'));
//    });
//
//    test('suggests builder fields must be same type', () async {
//      expect(await generate('''library data_class;
//
//part 'value.g.dart';
//abstract class Value implements Built<Value, ValueBuilder> {
//  Value._();
//  factory Value([void Function(ValueBuilder) updates]) = _\$Value;
//  int get foo;
//}
//abstract class ValueBuilder implements Builder<Value, ValueBuilder> {
//  ValueBuilder._();
//  factory ValueBuilder() = _\$ValueBuilder;
//  String foo;
//}'''), contains('1. Make builder field foo have type: int'));
//    });
//
//    test('ignores setters', () async {
//      expect(await generate('''library data_class;
//
//part 'value.g.dart';
//abstract class Value implements Built<Value, ValueBuilder> {
//  Value._();
//  factory Value([void Function(ValueBuilder) updates]) = _\$Value;
//  set foo(int foo) => print(foo);
//}
//abstract class ValueBuilder implements Builder<Value, ValueBuilder> {
//  ValueBuilder._();
//  factory ValueBuilder() = _\$ValueBuilder;
//  set foo(int foo) => print(foo);
//}'''), isNot(contains('1.')));
//    });
//
//    test('generates empty constructor with semicolon not braces', () async {
//      final generated = await generate('''library data_class;
//
//part 'value.g.dart';
//abstract class Value implements Built<Value, ValueBuilder> {
//  Value._();
//  factory Value([void Function(ValueBuilder) updates]) = _\$Value;
//}
//abstract class ValueBuilder implements Builder<Value, ValueBuilder> {
//  ValueBuilder._();
//  factory ValueBuilder() = _\$ValueBuilder;
//}
//''');
//      expect(generated, isNot(contains('super._() {}')));
//      expect(generated, contains('super._();'));
//    });
//  });
//
//  test('rejects hashCode', () async {
//    expect(
//        await generate('''library data_class;
//
//part 'value.g.dart';
//abstract class Value implements Built<Value, ValueBuilder> {
//  Value._();
//  factory Value([void Function(ValueBuilder) updates]) = _\$Value;
//  int get hashCode => 0;
//}'''),
//        contains(
//            '1. Stop implementing hashCode; it will be generated for you.'));
//  });
//
//  test('rejects operator==', () async {
//    expect(
//        await generate('''library data_class;
//
//part 'value.g.dart';
//abstract class Value implements Built<Value, ValueBuilder> {
//  Value._();
//  factory Value([void Function(ValueBuilder) updates]) = _\$Value;
//  bool operator==(other) => false;
//}'''),
//        contains(
//            '1. Stop implementing operator==; it will be generated for you.'));
//  });
//
//  test('uses toString()', () async {
//    expect(await generate('''library data_class;
//
//part 'value.g.dart';
//abstract class Value implements Built<Value, ValueBuilder> {
//  Value._();
//  factory Value([void Function(ValueBuilder) updates]) = _\$Value;
//  String toString() => 'hi!';
//}'''), isNot(contains('String toString()')));
//  });
//
//  test('suggests built_collection fields instead of SDK fields', () async {
//    expect(
//        await generate('''library data_class;
//
//part 'value.g.dart';
//abstract class Value implements Built<Value, ValueBuilder> {
//  Value._();
//  factory Value([void Function(ValueBuilder) updates]) = _\$Value;
//  List get list;
//  Set get set;
//  Map get map;
//}'''),
//        allOf(
//            contains('1. Make field "list" have type "BuiltList". '
//                'The current type, "List", is not allowed '
//                'because it is mutable.'),
//            contains('2. Make field "set" have type "BuiltSet". '
//                'The current type, "Set", is not allowed '
//                'because it is mutable.')));
//  });
//
//  test('rejects comparableBuilders with nestedBuilders', () async {
//    expect(
//        await generate('''library data_class;
//
//part 'value.g.dart';
//@BuiltValue(comparableBuilders: true)
//abstract class Value implements Built<Value, ValueBuilder> {
//  Value._();
//  factory Value([void Function(ValueBuilder) updates]) = _\$Value;
//  }'''),
//        contains(
//            '1. Set `nestedBuilders: false` in order to use `comparableBuilders: true`.'));
//  });
//
//  test('Cleans generated class names for private classes', () async {
//    expect(
//        await generate('''library data_class;
//
//part 'value.g.dart';
//abstract class _Value implements Built<_Value, _ValueBuilder> {
//  _Value._();
//  factory _Value([void Function(_ValueBuilder) updates]) = _\$Value;
//}'''),
//        allOf(
//          isNot(contains(r'_$_')),
//          isNot(contains(r'1.')),
//        ));
//  });
}

Matcher get containsErrors => contains('1.');

// Test setup.

final String pkgName = 'pkg';

final Builder builder = PartBuilder([DataClassGenerator()], '.g.dart');

Future<String> generate(String source) async {
  var srcs = <String, String>{
    'data_class|lib/data_class.dart': dataClassSource,
    '$pkgName|lib/value.dart': source,
  };

  // Capture any error from generation; if there is one, return that instead of
  // the generated output.
  String error;
  void captureError(LogRecord logRecord) {
    if (logRecord.error is InvalidGenerationSourceError) {
      if (error != null) throw StateError('Expected at most one error.');
      error = logRecord.error.toString();
    }
  }

  var writer = InMemoryAssetWriter();
  await testBuilder(builder, srcs,
      rootPackage: pkgName, writer: writer, onLog: captureError);
  return error ??
      String.fromCharCodes(
          writer.assets[AssetId(pkgName, 'lib/value.g.dart')] ?? []);
}

const String dataClassSource = r'''
library data_class;

class DataClass {
  const DataClass();
}

abstract class DataClassBuilder<V, B extends DataClassBuilder<V, B>> {
  void replace(V value);
  void update(updates(DataClassBuilder<V> builder));
  V build();
''';
