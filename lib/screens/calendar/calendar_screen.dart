import 'package:flutter/material.dart';
import 'package:subscription_monitoring/screens/calendar/calendar_model.dart';
import 'package:subscription_monitoring/screens/calendar/calendar_provider.dart';

import 'components/body.dart';

class CalendarScreen extends StatelessWidget {
  CalendarScreen({Key? key}) : super(key: key);

  final _model = CalendarModel();

  static String routeName = '/calendar';

  @override
  Widget build(BuildContext context) {
    return CalendarModelProvider(
      model: _model,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Calendar',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Body(subscriptions: _model.subscriptions),
      ),
    );
  }
}
