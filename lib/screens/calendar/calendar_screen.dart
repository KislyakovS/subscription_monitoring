import 'package:flutter/material.dart';
import 'package:subscription_monitoring/models/Subscription.dart';

import 'components/body.dart';

class CalendarScreen extends StatelessWidget {
  CalendarScreen({Key? key}) : super(key: key);

  static String routeName = '/calendar';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Calendar',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Body(subscriptions: <Subscription>[]),
    );
  }
}
