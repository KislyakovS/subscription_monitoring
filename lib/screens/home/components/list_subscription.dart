import 'package:flutter/material.dart';
import 'package:subscription_monitoring/components/components.dart';
import 'package:subscription_monitoring/models/Subscription.dart';
import 'package:subscription_monitoring/screens/screens.dart';

class ListSubscription extends StatelessWidget {
  const ListSubscription({Key? key, required this.subscriptions})
      : super(key: key);

  final List<Subscription> subscriptions;

  void _onTapSubscriptionCard(BuildContext context, Subscription subscription) {
    Navigator.pushNamed(context, SubscriptionDetailsScreen.routeName,
        arguments: SubscriptionDetailsArguments(subscription: subscription));
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
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
    );
  }
}
