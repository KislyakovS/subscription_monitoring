import 'package:subscription_monitoring/redux/store/store.dart';

import 'subscription_reducer.dart';

AppState reducer(AppState state, dynamic actions) =>
    AppState(subscriptions: subscriptionsReducer(state.subscriptions, actions));
