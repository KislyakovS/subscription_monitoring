import 'package:flutter/material.dart';
import 'package:subscription_monitoring/models/Subscription.dart';
import 'package:subscription_monitoring/screens/screens.dart';

class ListSubscriptionModel {
  void showDetails(BuildContext context, Subscription? subscription) {
    Navigator.pushNamed(
      context,
      FormScreen.routeName,
      arguments: FormArguments(subscription: subscription),
    );
  }
}
