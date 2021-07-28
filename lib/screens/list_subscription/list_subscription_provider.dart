import 'package:flutter/material.dart';

import 'list_subscription_model.dart';

class ListSubscriptionModelProvider extends InheritedWidget {
  final ListSubscriptionModel model;

  const ListSubscriptionModelProvider(
      {Key? key, required Widget child, required this.model})
      : super(key: key, child: child);

  static ListSubscriptionModelProvider? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<
            ListSubscriptionModelProvider>()
        ?.widget;

    return widget is ListSubscriptionModelProvider ? widget : null;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;
}
