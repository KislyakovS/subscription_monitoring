import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:subscription_monitoring/redux/store/store.dart';

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
      body: StoreConnector<AppState, AppState>(
        builder: (context, state) {
          final subscriptions = state.subscriptions;

          return Body(subscriptions: subscriptions);
        },
        converter: (store) => store.state,
      ),
    );
  }
}
