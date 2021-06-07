import 'package:flutter/material.dart';
import 'package:subscription_monitoring/theme/colors.dart';

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
    centerTitle: true,
    brightness: Brightness.light,
    iconTheme: IconThemeData(color: Colors.black),
  );
}
