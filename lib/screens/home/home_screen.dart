import 'package:flutter/material.dart';

import 'components/body.dart';
import 'home_model.dart';
import 'home_provider.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final _model = HomeModel();

  static String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return HomeModelProvider(
      model: _model,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'My Subscriptions',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Body(),
      ),
    );
  }
}
