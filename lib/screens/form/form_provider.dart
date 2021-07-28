import 'package:flutter/material.dart';

import 'form_model.dart';

class FormModelProvider extends InheritedWidget {
  final FormModel model;

  const FormModelProvider(
      {Key? key, required Widget child, required this.model})
      : super(key: key, child: child);

  static FormModelProvider? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<FormModelProvider>()
        ?.widget;

    return widget is FormModelProvider ? widget : null;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;
}
