import 'package:flutter/material.dart';
import 'package:subscription_monitoring/models/Subscription.dart';

import 'components/body.dart';

class FormScreen extends StatelessWidget {
  static String routeName = '/form';

  FormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as FormArguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          arguments.subscription.title,
          style: const TextStyle(color: Colors.black),
        ),
        actions: [
          TextButton(
            style: ButtonStyle(
              overlayColor: MaterialStateProperty.all(Colors.transparent),
            ),
            onPressed: () {},
            child: const Text(
              'Save',
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          ),
          const SizedBox(width: 10)
        ],
      ),
      body: Body(
        subscription: arguments.subscription,
      ),
    );
  }
}

class FormArguments {
  final Subscription subscription;

  FormArguments({required this.subscription});
}
