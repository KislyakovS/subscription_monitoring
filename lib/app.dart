import 'package:flutter/material.dart';
import 'package:subscription_monitoring/theme/theme.dart';

import 'routes.dart';
import 'screens/screens.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Subscription monitoring app',
      theme: theme(),
      initialRoute: ButtomNavigationScreen.routeName,
      routes: routes,
    );
  }
}
