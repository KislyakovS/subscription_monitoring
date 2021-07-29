import 'package:flutter/material.dart';
import 'package:subscription_monitoring/models/Subscription.dart';

import '../screens.dart';

class SubscriptionDetailsModel {
  Subscription subscription;

  SubscriptionDetailsModel({required this.subscription});

  void showEdit(BuildContext context) {
    Navigator.pushNamed(
      context,
      FormScreen.routeName,
      arguments: FormArguments(subscription: subscription, isUpdate: true),
    );
  }
}
