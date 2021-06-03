import 'package:flutter/material.dart';
import 'package:subscription_monitoring/constants.dart';
import 'package:subscription_monitoring/models/Subscription.dart';

import '../../../components/components.dart';

class Body extends StatelessWidget {
  final Subscription subscription;

  const Body({Key? key, required this.subscription}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: defaultPaddingScreen),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SubscriptionHeader(
              subscription: subscription,
              isShowDate: true,
            ),
            const SizedBox(height: 20),
            Wrapper(
              child: ChartBar(),
            ),
            const SizedBox(height: 20),
            Wrapper(
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
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
