import 'package:flutter/material.dart';
import 'package:subscription_monitoring/models/Subscription.dart';

import 'components/body.dart';

class FormScreen extends StatelessWidget {
  static String routeName = '/form';

  const FormScreen({Key? key}) : super(key: key);

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
      ),
      body: Body(
          subscription: arguments.subscription, isUpdate: arguments.isUpdate),
    );
  }
}

class FormArguments {
  final Subscription subscription;
  final bool isUpdate;

  FormArguments({required this.subscription, this.isUpdate = false});
}
