import 'package:flutter/material.dart';
import 'package:subscription_monitoring/colors.dart';
import 'package:subscription_monitoring/components/line_percent.dart';
import 'package:subscription_monitoring/models/Subscription.dart';

class SubscriptionCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  demoSubscription.imageSrc,
                  width: 70,
                  height: 70,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                'Netflix',
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
          const SizedBox(height: 15),
          Text('Оплата через 4 дня'),
          const SizedBox(height: 5),
          SizedBox(
            width: double.infinity,
            child: LinePercent(
              fillColor: primaryColor.withOpacity(0.7),
              lineColor: primaryColor,
              procent: 0.8,
            ),
          ),
          const SizedBox(height: 15),
          Text.rich(
            TextSpan(
              text: '\$ 10.99',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              children: [
                TextSpan(
                  text: '/mo',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
