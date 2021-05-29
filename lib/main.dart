import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:subscription_monitoring/colors.dart';
import 'package:subscription_monitoring/theme.dart';

import 'routes.dart';
import 'screens/bottom_navigation/bottom_navigation_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    //Lets make the Status Bar Transparent
    statusBarColor: Colors.transparent,
    systemNavigationBarColor: defaultBackground,

    //Lets make the status bar icon brightness to bright
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
