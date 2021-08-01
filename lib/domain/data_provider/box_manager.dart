import 'package:hive_flutter/hive_flutter.dart';
import 'package:subscription_monitoring/models/Subscription.dart';

class BoxManager {
  static final BoxManager instance = BoxManager._();

  BoxManager._();

  Future<Box<Subscription>> openSubscriptionBox() async {
    return _openBox(
      'subscriptions_box',
      subscriptionHiveTypeId,
      SubscriptionAdapter(),
    );
  }

  Future<void> closeBox<T>(Box<T> box) async {
    await box.compact();
    await box.close();
  }

  Future<Box<T>> _openBox<T>(
    String name,
    int typeId,
    TypeAdapter<T> adapter,
  ) async {
    if (!Hive.isAdapterRegistered(typeId)) {
      Hive.registerAdapter(adapter);
    }

    return Hive.openBox(name);
  }
}
