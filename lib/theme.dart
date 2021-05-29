import 'package:flutter/material.dart';
import 'package:subscription_monitoring/colors.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: defaultBackground,
    appBarTheme: appBarTheme(),
  );
}

AppBarTheme appBarTheme() {
  return const AppBarTheme(
    elevation: 0,
    backgroundColor: defaultBackground,
    brightness: Brightness.light,
  );
}
