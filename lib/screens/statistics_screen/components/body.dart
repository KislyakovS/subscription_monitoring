import 'package:flutter/material.dart';
import 'package:subscription_monitoring/components/wrapper.dart';
import 'package:subscription_monitoring/constants.dart';
import 'package:subscription_monitoring/screens/statistics_screen/components/info.dart';

import '../../../components/chart_bar.dart';
import '../../../components/chart_pie.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: defaultPaddingScreen),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Info(),
            const SizedBox(height: 20),
            Wrapper(
              child: ChartBar(),
            ),
            const SizedBox(height: 20),
            Wrapper(
              child: ChartPie(),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
