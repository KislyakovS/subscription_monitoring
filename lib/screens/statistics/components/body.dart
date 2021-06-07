import 'package:flutter/material.dart';
import 'package:subscription_monitoring/components/wrapper.dart';
import 'package:subscription_monitoring/theme/constants.dart';

import '../../../components/components.dart';
import 'info.dart';

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
