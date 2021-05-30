import 'package:flutter/material.dart';
import 'package:subscription_monitoring/components/subscription_card.dart';
import 'package:subscription_monitoring/constants.dart';
import 'package:subscription_monitoring/models/Subscription.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: defaultPaddingScreen),
      child: ListView.separated(
          itemBuilder: (context, index) {
            if (index == demoSubscriptions.length) {
              return const SizedBox(height: 10);
            }

            return SubscriptionCard(
                subscription: demoSubscriptions[index], press: () {});
          },
          separatorBuilder: (context, _) => const SizedBox(height: 20),
          itemCount: demoSubscriptions.length + 1),
    );
  }
}
