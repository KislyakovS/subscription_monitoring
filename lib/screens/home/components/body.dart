import 'package:flutter/material.dart';
import 'package:subscription_monitoring/constants.dart';
import 'package:subscription_monitoring/models/Subscription.dart';

import 'empty_message.dart';
import 'list_subscription.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: defaultPaddingScreen),
      child: demoSubscriptions.isEmpty
          ? const EmptyMessage()
          : ListSubscription(subscriptions: demoSubscriptions),
    );
  }
}
