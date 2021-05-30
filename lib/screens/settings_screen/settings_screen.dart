import 'package:flutter/material.dart';

import 'components/body.dart';

class SettingsScreen extends StatelessWidget {
  static String routeName = '/settings';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Settings',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Body(),
    );
  }
}
