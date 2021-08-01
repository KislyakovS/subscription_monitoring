import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:subscription_monitoring/domain/data_provider/box_manager.dart';
import 'package:subscription_monitoring/models/Subscription.dart';

import '../screens.dart';

class HomeModel extends ChangeNotifier {
  late Box<Subscription> _boxSubscription;

  var _subscriptions = <Subscription>[];

  List<Subscription> get subscriptions => _subscriptions.toList();

  HomeModel() {
    _setup();
  }

  void _setup() async {
    _boxSubscription = await BoxManager.instance.openSubscriptionBox();
    _boxSubscription.listenable().addListener(_read);
  }

  void _read() {
    _subscriptions = _boxSubscription.values.toList();
    notifyListeners();
  }

  void showDetails(BuildContext context, Subscription subscription) {
    Navigator.pushNamed(
      context,
      SubscriptionDetailsScreen.routeName,
      arguments: SubscriptionDetailsArguments(subscription: subscription),
    );
  }
}
