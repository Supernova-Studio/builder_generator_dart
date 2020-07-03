// Copyright (c) 2018, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:build/build.dart';

import 'package:source_gen/source_gen.dart';

import 'data_class_generator.dart';

Builder builtValue(BuilderOptions _) =>
    SharedPartBuilder([DataClassGenerator()], 'built_value');
