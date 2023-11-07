import 'package:flutter/material.dart';

extension NDMaterialStatePropertyUtils<T> on MaterialStateProperty<T> {
  static MaterialStateProperty<T> resolveWith<T>({
    Map<MaterialState, T>? values,
    required T defaultValue,
  }) {
    if (values == null) {
      return MaterialStatePropertyAll(defaultValue);
    }

    return MaterialStateProperty.resolveWith((states) {
      for (var entry in values.entries) {
        if (states.contains(entry.key)) {
          return entry.value;
        }
      }
      return defaultValue;
    });
  }
}
