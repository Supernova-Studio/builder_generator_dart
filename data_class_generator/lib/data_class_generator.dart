// Copyright (c) 2015, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:async';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import 'src/value_source_class.dart';

/// Generator for Data Classes.
class DataClassGenerator extends Generator {
  // Allow creating via `const` as well as enforces immutability here.
  const DataClassGenerator();

  @override
  Future<String> generate(LibraryReader library, BuildStep buildStep) async {
    var result = StringBuffer();

    for (var element in library.allElements) {
      if (element is ClassElement &&
          ValueSourceClass.needDataClass(element)) {
        try {
          result.writeln(ValueSourceClass(element).generateCode() ?? '');
        } catch (e, st) {
          result.writeln(_error(e));
          log.severe('Error in DataClassGenerator for ${element.name}.', e, st);
        }
      }
    }

    if (result.isNotEmpty) {
      return '$result'
          '\n'
          '// ignore_for_file: '
          'always_put_control_body_on_new_line,'
          'always_specify_types,'
          'annotate_overrides,'
          'avoid_annotating_with_dynamic,'
          'avoid_as,'
          'avoid_catches_without_on_clauses,'
          'avoid_returning_this,'
          'lines_longer_than_80_chars,'
          'omit_local_variable_types,'
          'prefer_expression_function_bodies,'
          'sort_constructors_first,'
          'test_types_in_equals,'
          'unnecessary_const,'
          'unnecessary_new';
    } else {
      return null;
    }
  }
}

String _error(Object error) {
  var lines = '$error'.split('\n');
  var indented = lines.skip(1).map((l) => '//        $l'.trim()).join('\n');
  return '// Error: ${lines.first}\n$indented';
}
