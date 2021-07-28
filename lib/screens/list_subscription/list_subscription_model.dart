import 'package:flutter/material.dart';
import 'package:subscription_monitoring/models/Templates.dart';
import 'package:subscription_monitoring/screens/screens.dart';

class ListSubscriptionModel {
  void showDetails(BuildContext context, Template? template) {
    Navigator.pushNamed(
      context,
      FormScreen.routeName,
      arguments: FormArguments(template: template),
    );
  }
}
