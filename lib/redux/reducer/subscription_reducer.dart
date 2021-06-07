import 'package:redux/redux.dart';
import 'package:subscription_monitoring/models/Subscription.dart';
import 'package:subscription_monitoring/redux/actions/subscriptions_actions.dart';

Reducer<List<Subscription>> subscriptionsReducer = combineReducers([
  TypedReducer<List<Subscription>, RemoveSubscription>(_removeSubscription),
  TypedReducer<List<Subscription>, AddSubscription>(_addSubscription)
]);

List<Subscription> _removeSubscription(
    List<Subscription> subscriptions, RemoveSubscription action) {
  return subscriptions.where((it) => it.id != action.id).toList();
}

List<Subscription> _addSubscription(
    List<Subscription> subscriptions, AddSubscription action) {
  return [...subscriptions, action.subscription];
}
