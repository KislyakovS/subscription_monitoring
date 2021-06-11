import 'package:subscription_monitoring/models/Subscription.dart';

class RemoveSubscription {
  final int id;

  RemoveSubscription({required this.id});
}

class AddSubscription {
  final Subscription subscription;

  AddSubscription({required this.subscription});
}

class UpdateSubscription {
  final int id;
  final Subscription subscription;

  UpdateSubscription({required this.id, required this.subscription});
}
