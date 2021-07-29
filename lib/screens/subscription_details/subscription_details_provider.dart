import 'package:flutter/material.dart';

import 'subscription_details_model.dart';

class SubscriptionDetailsModelProvider extends InheritedWidget {
  final SubscriptionDetailsModel model;

  SubscriptionDetailsModelProvider(
      {Key? key, required Widget child, required this.model})
      : super(key: key, child: child);

  static SubscriptionDetailsModelProvider? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<
            SubscriptionDetailsModelProvider>()
        ?.widget;

    return widget is SubscriptionDetailsModelProvider ? widget : null;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;
}
