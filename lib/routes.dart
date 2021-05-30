import 'package:flutter/material.dart';

import 'screens/bottom_navigation/bottom_navigation_screen.dart';
import 'screens/home_screen/home_screen.dart';

final Map<String, WidgetBuilder> routes = {
  ButtomNavigationScreen.routeName: (context) => ButtomNavigationScreen(),
  HomeScreen.routeName: (context) => HomeScreen()
};
