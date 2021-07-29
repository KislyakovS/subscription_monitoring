import 'package:flutter/material.dart';
import 'package:subscription_monitoring/components/components.dart';
import 'package:subscription_monitoring/models/Subscription.dart';

import '../home_provider.dart';

class ListSubscription extends StatelessWidget {
  const ListSubscription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = HomeModelProvider.read(context)?.model;
    final subscriptions = model?.subscriptions ?? [];

    if (subscriptions.isEmpty) {
      return const EmptyMessage();
    }

    return ListView.separated(
      itemBuilder: (context, index) {
        if (index == subscriptions.length) {
          return const SizedBox(height: 10);
        }

        return SubscriptionCard(
          subscription: subscriptions[index],
          press: () => model?.showDetails(context, subscriptions[index]),
        );
      },
      separatorBuilder: (context, _) => const SizedBox(height: 20),
      itemCount: subscriptions.length + 1,
    );
  }
}
