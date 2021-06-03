import 'package:flutter/material.dart';
import 'package:subscription_monitoring/components/subscription_card.dart';
import 'package:subscription_monitoring/constants.dart';
import 'package:subscription_monitoring/models/Subscription.dart';

import '../../screens.dart';

class Body extends StatelessWidget {
  void _onTapSubscriptionCard(BuildContext context, Subscription subscription) {
    Navigator.pushNamed(context, SubscriptionDetailsScreen.routeName,
        arguments: SubscriptionDetailsArguments(subscription: subscription));
  }

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
            subscription: demoSubscriptions[index],
            press: () =>
                _onTapSubscriptionCard(context, demoSubscriptions[index]),
          );
        },
        separatorBuilder: (context, _) => const SizedBox(height: 20),
        itemCount: demoSubscriptions.length + 1,
      ),
    );
  }
}
