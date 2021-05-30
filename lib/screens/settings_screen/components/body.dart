import 'package:flutter/material.dart';
import 'package:subscription_monitoring/components/platform_switch.dart';
import 'package:subscription_monitoring/components/wrapper.dart';
import 'package:subscription_monitoring/constants.dart';
import 'package:subscription_monitoring/screens/settings_screen/components/settings_list.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: defaultPaddingScreen),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SettingsList(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
