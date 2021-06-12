import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:subscription_monitoring/components/components.dart';
import 'package:subscription_monitoring/redux/store/store.dart';
import 'package:subscription_monitoring/theme/constants.dart';

import 'list_subscription.dart';

class Body extends StatelessWidget {
  Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: defaultPaddingScreen),
      child: StoreConnector<AppState, AppState>(
        builder: (context, state) {
          final subscriptions = state.subscriptions;

          if (subscriptions.isEmpty) {
            return const EmptyMessage();
          }

          return ListSubscription(
            subscriptions: subscriptions,
          );
        },
        converter: (store) => store.state,
      ),
    );
  }
}
