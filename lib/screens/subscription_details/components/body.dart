import 'package:flutter/material.dart';
import 'package:subscription_monitoring/components/components.dart';
import 'package:subscription_monitoring/screens/subscription_details/subscription_details_provider.dart';
import 'package:subscription_monitoring/theme/constants.dart';

import 'buttons.dart';
import 'chart.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  void _onTapRemove(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    final model = SubscriptionDetailsModelProvider.read(context)?.model;
    final subscription = model!.subscription;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: defaultPaddingScreen),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SubscriptionHeader(
              title: subscription.title,
              imageSrc: subscription.imageSrc,
              date: subscription.endDate,
            ),
            const SizedBox(height: 20),
            Buttons(
              onTapEdit: () => model.showEdit(context),
              onTapRemove: () => _onTapRemove(context),
            ),
            const SizedBox(height: 20),
            const Chart(),
            const SizedBox(height: 20),
            // History(subscription: subscription),
            // const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
