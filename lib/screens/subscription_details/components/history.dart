import 'package:flutter/material.dart';
import 'package:subscription_monitoring/components/components.dart';
import 'package:subscription_monitoring/models/Subscription.dart';

class History extends StatelessWidget {
  const History({Key? key, required this.subscription}) : super(key: key);

  final Subscription subscription;

  @override
  Widget build(BuildContext context) {
    return Wrapper(
      title: 'History',
      buttonText: 'Show all',
      press: () {},
      child: Column(
        children: List.generate(
          5,
          (index) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: SubscriptionHeader(
              subscription: subscription,
              isShowDate: true,
            ),
          ),
        ),
      ),
    );
  }
}
