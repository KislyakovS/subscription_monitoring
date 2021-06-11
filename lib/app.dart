import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:subscription_monitoring/redux/reducer/reducer.dart';
import 'package:subscription_monitoring/redux/store/store.dart';
import 'package:subscription_monitoring/theme/theme.dart';

import 'models/Subscription.dart';
import 'routes.dart';
import 'screens/screens.dart';

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  final Store<AppState> store =
      Store(reducer, initialState: AppState(subscriptions: demoSubscriptions));

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Subscription monitoring app',
        theme: theme(),
        initialRoute: ButtomNavigationScreen.routeName,
        routes: routes,
      ),
    );
  }
}
