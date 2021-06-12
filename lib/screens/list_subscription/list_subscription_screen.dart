import 'package:flutter/material.dart';

import 'components/body.dart';

class ListSubscriptionScreen extends StatelessWidget {
  ListSubscriptionScreen({Key? key}) : super(key: key);

  static String routeName = '/list_subscription';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'New Subscription',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Body(),
    );
  }
}
