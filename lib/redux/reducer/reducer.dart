import 'package:subscription_monitoring/redux/store/store.dart';

import 'subscription_reducer.dart';

AppStore reducer(AppStore state, dynamic actions) =>
    AppStore(subscriptions: subscriptionsReducer(state.subscriptions, actions));
