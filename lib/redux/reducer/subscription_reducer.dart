import 'package:redux/redux.dart';
import 'package:subscription_monitoring/models/Subscription.dart';
import 'package:subscription_monitoring/redux/actions/subscriptions_actions.dart';

Reducer<List<Subscription>> subscriptionsReducer = combineReducers([
  TypedReducer<List<Subscription>, RemoveSubscription>(_removeSubscription),
  TypedReducer<List<Subscription>, AddSubscription>(_addSubscription),
  TypedReducer<List<Subscription>, UpdateSubscription>(_updateSubscription),
]);

List<Subscription> _removeSubscription(
    List<Subscription> subscriptions, RemoveSubscription action) {
  return subscriptions.where((it) => it.id != action.id).toList();
}

List<Subscription> _addSubscription(
    List<Subscription> subscriptions, AddSubscription action) {
  return [...subscriptions, action.subscription];
}

List<Subscription> _updateSubscription(
    List<Subscription> subscriptions, UpdateSubscription action) {
  var newSubscriptions = [...subscriptions];
  final index = newSubscriptions.indexWhere((it) => it.id == action.id);
  newSubscriptions[index] = action.subscription;
  return newSubscriptions;
}
