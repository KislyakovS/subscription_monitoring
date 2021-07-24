import 'package:flutter/material.dart';
import 'package:subscription_monitoring/components/components.dart';
import 'package:subscription_monitoring/theme/constants.dart';

import 'info.dart';

class Body extends StatelessWidget {
  Body({Key? key}) : super(key: key);

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
