import 'package:build/build.dart';

import 'package:source_gen/source_gen.dart';

import 'data_class_generator.dart';

Builder dataClass(BuilderOptions _) =>
    SharedPartBuilder([DataClassGenerator()], 'data_class');
