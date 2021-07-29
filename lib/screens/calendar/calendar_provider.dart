import 'package:flutter/material.dart';
import 'package:subscription_monitoring/screens/calendar/calendar_model.dart';

class CalendarModelProvider extends InheritedWidget {
  CalendarModel model;

  CalendarModelProvider({Key? key, required Widget child, required this.model})
      : super(key: key, child: child);

  static CalendarModelProvider? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<CalendarModelProvider>()
        ?.widget;

    return widget is CalendarModelProvider ? widget : null;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;
}
