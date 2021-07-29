import 'package:flutter/material.dart';
import 'package:subscription_monitoring/models/Subscription.dart';
import 'package:subscription_monitoring/theme/constants.dart';

import 'list_subscription.dart';

class Body extends StatelessWidget {
  Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: defaultPaddingScreen),
      child: ListSubscription(),
    );
  }
}
