import 'dart:collection';

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:built_collection/built_collection.dart';

BuiltList<FieldElement> collectFields(ClassElement element) =>
    collectFieldsForType(element.thisType);

BuiltList<FieldElement> collectFieldsForType(InterfaceType type) {
  var fields = <FieldElement>[];
  // Add fields from this class before interfaces, so they're added to the set
  // first below. Re-added fields from interfaces are ignored.
  fields.addAll(_fieldElementsForType(type));

  var superclass = type.superclass;
  while (superclass != null && superclass.name != 'Object') {
    fields.addAll(_fieldElementsForType(superclass));

    superclass = superclass.superclass;
  }
//  Set<InterfaceType>.from(element.allSupertypes)
//    ..addAll(element.type.mixins)
//    ..forEach((interface) => fields.addAll(collectFieldsForType(interface)));

  // Overridden fields have multiple declarations, so deduplicate by adding
  // to a set that compares on field name.
  var fieldSet = LinkedHashSet<FieldElement>(
      equals: (a, b) => a.displayName == b.displayName,
      hashCode: (a) => a.displayName.hashCode);
  fieldSet.addAll(fields);

  // Filter to fields that are not implemented by a mixin.
  return BuiltList<FieldElement>.build((b) => b
    ..addAll(fieldSet)
    ..where((field) => (field.name) != 'hashCode'));
}

BuiltList<FieldElement> _fieldElementsForType(InterfaceType type) {
  var result = ListBuilder<FieldElement>();
  for (var accessor in type.accessors) {
    if (accessor.isSetter) continue;
    result.add(accessor.variable as FieldElement);
  }
  return result.build();
}
