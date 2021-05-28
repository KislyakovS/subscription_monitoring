import 'package:flutter/material.dart';
import 'package:subscription_monitoring/theme.dart';

import 'routes.dart';
import 'screens/bottom_navigation_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
