import 'package:subscription_monitoring/models/Subscription.dart';

class RemoveSubscription {
  final int id;

  RemoveSubscription({required this.id});
}

class AddSubscription {
  final Subscription subscription;

  AddSubscription({required this.subscription});
}
