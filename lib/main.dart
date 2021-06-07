import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:subscription_monitoring/theme/colors.dart';

import 'app.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    systemNavigationBarColor: defaultBackground,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));

  runApp(App());
}
