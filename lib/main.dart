import 'package:flutter/material.dart';
import 'package:subscription_monitoring/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Subscription monitoring app',
      theme: theme(),
      
    );
  }
}
