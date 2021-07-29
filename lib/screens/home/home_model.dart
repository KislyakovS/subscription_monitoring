import 'package:flutter/material.dart';
import 'package:subscription_monitoring/models/Subscription.dart';

import '../screens.dart';

class HomeModel {
  var _subscriptions = <Subscription>[];

  List<Subscription> get subscriptions => _subscriptions.toList();

  void showDetails(BuildContext context, Subscription subscription) {
    Navigator.pushNamed(
      context,
      SubscriptionDetailsScreen.routeName,
      arguments: SubscriptionDetailsArguments(subscription: subscription),
    );
  }
}
