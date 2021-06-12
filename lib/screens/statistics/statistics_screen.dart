import 'package:flutter/material.dart';

import 'components/body.dart';

class StatisticsScreen extends StatelessWidget {
  StatisticsScreen({Key? key}) : super(key: key);

  static String routeName = '/statistics';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Statistics',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Body(),
    );
  }
}
