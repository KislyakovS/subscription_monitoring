import 'package:flutter/material.dart';

import 'screens/screens.dart';

final Map<String, WidgetBuilder> routes = {
  ButtomNavigationScreen.routeName: (context) => ButtomNavigationScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  CalendarScreen.routeName: (context) => CalendarScreen(),
  StatisticsScreen.routeName: (context) => StatisticsScreen(),
  SettingsScreen.routeName: (context) => SettingsScreen(),
  ListSubscriptionScreen.routeName: (context) => ListSubscriptionScreen(),
  SubscriptionDetailsScreen.routeName: (context) => SubscriptionDetailsScreen(),
  FormScreen.routeName: (context) => const FormScreen()
};
