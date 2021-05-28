import 'package:flutter/material.dart';
import 'package:subscription_monitoring/colors.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: defaultBackground,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: defaultBackground,
      elevation: 0,
    ),
  );
}
