import 'package:flutter/material.dart';
import 'package:subscription_monitoring/models/Subscription.dart';
import 'package:subscription_monitoring/screens/subscription_details/subscription_details_provider.dart';

import 'components/body.dart';
import 'subscription_details_model.dart';

class SubscriptionDetailsScreen extends StatefulWidget {
  SubscriptionDetailsScreen({Key? key}) : super(key: key);

  static String routeName = '/subscription_details';

  @override
  _SubscriptionDetailsScreenState createState() =>
      _SubscriptionDetailsScreenState();
}

class _SubscriptionDetailsScreenState extends State<SubscriptionDetailsScreen> {
  SubscriptionDetailsModel? _model;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (_model == null) {
      final arguments = ModalRoute.of(context)!.settings.arguments
          as SubscriptionDetailsArguments;

      _model = SubscriptionDetailsModel(subscription: arguments.subscription);
    }
  }

  @override
  Widget build(BuildContext context) {
    final model = _model;

    if (model == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return SubscriptionDetailsModelProvider(
      model: model,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            model.subscription.title,
            style: const TextStyle(color: Colors.black),
          ),
        ),
        body: const Body(),
      ),
    );
  }
}

class SubscriptionDetailsArguments {
  final Subscription subscription;

  SubscriptionDetailsArguments({required this.subscription});
}
