import 'package:subscription_monitoring/models/Subscription.dart';

class CalendarModel {
  // var _subscriptions = <Subscription>[];
  final _subscriptions = demoSubscriptions;

  List<Subscription> get subscriptions => _subscriptions.toList();
}
