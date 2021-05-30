import 'package:flutter/material.dart';

import 'screens/bottom_navigation/bottom_navigation_screen.dart';
import 'screens/calendar_screen/calendar_screen.dart';
import 'screens/home_screen/home_screen.dart';
import 'screens/settings_screen/settings_screen.dart';
import 'screens/statistics_screen/statistics_screen.dart';

final Map<String, WidgetBuilder> routes = {
  ButtomNavigationScreen.routeName: (context) => ButtomNavigationScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  CalendarScreen.routeName: (context) => CalendarScreen(),
  StatisticsScreen.routeName: (context) => StatisticsScreen(),
  SettingsScreen.routeName: (context) => SettingsScreen(),
};
