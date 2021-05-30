import 'package:flutter/material.dart';
import 'package:subscription_monitoring/components/subscription_header.dart';
import 'package:subscription_monitoring/components/wrapper.dart';
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

          return Wrapper(
            padding: 15,
            child: SubscriptionHeader(
              subscription: demoSubscriptions[index],
              imageSize: 60,
            ),
          );
        },
        separatorBuilder: (context, _) => const SizedBox(height: 20),
        itemCount: demoSubscriptions.length + 1,
      ),
    );
  }
}
