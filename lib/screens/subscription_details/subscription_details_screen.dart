import 'package:flutter/material.dart';
import 'package:subscription_monitoring/models/Subscription.dart';

import 'components/body.dart';

class SubscriptionDetailsScreen extends StatelessWidget {
  static String routeName = '/subscription_details';

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments
        as SubscriptionDetailsArguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          arguments.subscription.title,
          style: const TextStyle(color: Colors.black),
        ),
      ),
      body: Body(
        subscription: arguments.subscription,
      ),
    );
  }
}

class SubscriptionDetailsArguments {
  final Subscription subscription;

  SubscriptionDetailsArguments({required this.subscription});
}
