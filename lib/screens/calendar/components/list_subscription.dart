import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:subscription_monitoring/models/Subscription.dart';

import '../../../components/components.dart';

class ListSubscription extends StatelessWidget {
  final List<Subscription> subscriptions;
  final DateTime date;

  const ListSubscription(
      {Key? key, required this.subscriptions, required this.date})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrapper(
      child: subscriptions.isEmpty
          ? _buildEmptyMessage()
          : _buildListSubscription(),
    );
  }

  Text _buildEmptyMessage() {
    final format = DateFormat('d MMMM');

    return Text(
      'As of ${format.format(date)}, there are no subscriptions',
      textAlign: TextAlign.center,
    );
  }

  Column _buildListSubscription() {
    return Column(
      children: [
        ...subscriptions.map(
          (subscription) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: SubscriptionHeader(
              subscription: subscription,
              isShowDate: true,
            ),
          ),
        ),
      ],
    );
  }
}
