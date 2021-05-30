import 'package:flutter/material.dart';
import 'package:subscription_monitoring/colors.dart';
import 'package:subscription_monitoring/components/bouncing_button.dart';
import 'package:subscription_monitoring/components/line_percent.dart';
import 'package:subscription_monitoring/components/subscription_header.dart';
import 'package:subscription_monitoring/models/Subscription.dart';

class SubscriptionCard extends StatelessWidget {
  final Subscription subscription;
  final GestureTapCallback press;

  const SubscriptionCard({
    Key? key,
    required this.subscription,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BouncingButton(
      press: press,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 2),
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SubscriptionHeader(subscription: subscription),
            const SizedBox(height: 15),
            _buildProgress(),
            const SizedBox(height: 15),
            _buildPrice()
          ],
        ),
      ),
    );
  }

  Text _buildPrice() {
    return Text.rich(
      TextSpan(
        text: '\$ ${subscription.price}',
        style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
        children: [
          TextSpan(
            text: '/month',
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
    );
  }

  Column _buildProgress() {
    final remainedDat = subscription.endDate.difference(DateTime.now()).inDays;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Payment in $remainedDat days'),
        const SizedBox(height: 5),
        SizedBox(
          width: double.infinity,
          child: LinePercent(
            fillColor: primaryColor.withOpacity(0.7),
            lineColor: primaryColor,
            procent: 0.8,
          ),
        )
      ],
    );
  }
}
