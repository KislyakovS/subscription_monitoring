import 'package:flutter/material.dart';

import 'home_model.dart';

class HomeModelProvider extends InheritedWidget {
  final HomeModel model;

  HomeModelProvider({Key? key, required Widget child, required this.model})
      : super(key: key, child: child);

  static HomeModelProvider? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<HomeModelProvider>()
        ?.widget;

    return widget is HomeModelProvider ? widget : null;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;
}
