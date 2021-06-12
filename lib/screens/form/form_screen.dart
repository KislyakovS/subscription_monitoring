import 'package:flutter/material.dart';
import 'package:subscription_monitoring/models/Subscription.dart';
import 'package:subscription_monitoring/models/Templates.dart';

import 'components/body.dart';

class FormScreen extends StatelessWidget {
  static String routeName = '/form';

  const FormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as FormArguments;

    final subscription = arguments.subscription;
    final template = arguments.template;
    final isUpdate = arguments.isUpdate;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          subscription != null ? subscription.title : template!.title,
          style: const TextStyle(color: Colors.black),
        ),
      ),
      body: Body(
        subscription: subscription,
        template: template,
        isUpdate: isUpdate,
      ),
    );
  }
}

class FormArguments {
  final Subscription? subscription;
  final Template? template;
  final bool isUpdate;

  FormArguments({
    this.subscription = null,
    this.template = null,
    this.isUpdate = false,
  });
}
