import 'package:flutter/material.dart';
import 'package:subscription_monitoring/service/storage.dart';
import 'package:subscription_monitoring/theme/constants.dart';

import './settings_list.dart';

class Body extends StatelessWidget {
  Body({Key? key}) : super(key: key);

  Future<void> _pressButton() async {
    final storage = Storage();

    //final isNotification = await storage.getSettings();
    // print(isNotification);
  }

  Future<void> _setButton() async {
    final storage = Storage();

    await storage.setSettings(SettingsKey.notification, true);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: defaultPaddingScreen),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SettingsList(),
            TextButton(
              onPressed: _pressButton,
              child: Text('get'),
            ),
            TextButton(
              onPressed: _setButton,
              child: Text('set'),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
