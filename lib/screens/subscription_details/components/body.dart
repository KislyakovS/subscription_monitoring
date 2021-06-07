import 'package:flutter/material.dart';
import 'package:subscription_monitoring/theme/constants.dart';
import 'package:subscription_monitoring/models/Subscription.dart';
import 'package:subscription_monitoring/screens/screens.dart';

import '../../../components/components.dart';
import 'buttons.dart';
import 'chart.dart';
import 'history.dart';

class Body extends StatelessWidget {
  final Subscription subscription;

  const Body({Key? key, required this.subscription}) : super(key: key);

  void _onTapEdit(BuildContext context) {
    Navigator.pushNamed(
      context,
      FormScreen.routeName,
      arguments: FormArguments(subscription: subscription),
    );
  }

  void _onTapRemove() {}

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
            const SizedBox(height: 10),
            Buttons(
              onTapEdit: () => _onTapEdit(context),
              onTapRemove: _onTapRemove,
            ),
            const SizedBox(height: 10),
            const Chart(),
            const SizedBox(height: 20),
            History(subscription: subscription),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
