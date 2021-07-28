import 'package:flutter/material.dart';

import 'components/body.dart';
import 'list_subscription_model.dart';
import 'list_subscription_provider.dart';

class ListSubscriptionScreen extends StatelessWidget {
  ListSubscriptionScreen({Key? key}) : super(key: key);

  final _model = ListSubscriptionModel();

  static String routeName = '/list_subscription';

  @override
  Widget build(BuildContext context) {
    return ListSubscriptionModelProvider(
      model: _model,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'New Subscription',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Body(),
      ),
    );
  }
}
