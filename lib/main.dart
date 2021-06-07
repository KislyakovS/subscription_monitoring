import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:subscription_monitoring/theme/colors.dart';
import 'package:subscription_monitoring/theme/theme.dart';

import 'routes.dart';
import 'screens/screens.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    systemNavigationBarColor: defaultBackground,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));

  runApp(MyApp());
}

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
