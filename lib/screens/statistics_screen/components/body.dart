import 'package:flutter/material.dart';
import 'package:subscription_monitoring/components/wrapper.dart';
import 'package:subscription_monitoring/constants.dart';

import 'bar_chart.dart';
import 'pie_chart.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: defaultPaddingScreen),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Wrapper(
              child: Column(
                children: [
                  Row(children: [
                    Text(
                      'All subscriptions',
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      '4',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ]),
                  Divider(),
                  Row(children: [
                    Text(
                      'Total',
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      '\$ 499',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ]),
                  Divider(),
                  Row(children: [
                    Text(
                      'Most expensive \'Netflix\'',
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      '\$ 12.99',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ]),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Wrapper(
              child: BarChartSimple(),
            ),
            const SizedBox(height: 20),
            Wrapper(
              child: PieChartSample2(),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
