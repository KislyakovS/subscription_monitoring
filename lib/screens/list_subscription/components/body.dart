import 'package:flutter/material.dart';
import 'package:subscription_monitoring/theme/constants.dart';
import 'package:subscription_monitoring/models/Subscription.dart';

import '../../../components/components.dart';
import '../../screens.dart';

class Body extends StatelessWidget {
  void _onTapSubscription(BuildContext context, Subscription subscription) {
    Navigator.pushNamed(
      context,
      FormScreen.routeName,
      arguments: FormArguments(subscription: subscription),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: defaultPaddingScreen),
      child: ListView.separated(
        itemBuilder: (context, index) {
          if (index == demoSubscriptions.length) {
            return const SizedBox(height: 20);
          }

          return BouncingButton(
            press: () => _onTapSubscription(context, demoSubscriptions[index]),
            child: Wrapper(
              padding: 15,
              child: SubscriptionHeader(
                subscription: demoSubscriptions[index],
                imageSize: 60,
              ),
            ),
          );
        },
        separatorBuilder: (context, _) => const SizedBox(height: 20),
        itemCount: demoSubscriptions.length + 1,
      ),
    );
  }
}
