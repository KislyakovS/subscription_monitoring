import 'package:flutter/material.dart';
import 'package:subscription_monitoring/models/Subscription.dart';

class SubscriptionDetailsScreen extends StatelessWidget {
  static String routeName = '/subscription_details';

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

class SubscriptionDetailsArguments {
  final Subscription subscription;

  SubscriptionDetailsArguments({required this.subscription});
}
