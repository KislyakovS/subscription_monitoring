import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:subscription_monitoring/components/components.dart';
import 'package:subscription_monitoring/redux/store/store.dart';
import 'package:subscription_monitoring/theme/constants.dart';

import 'info.dart';

class Body extends StatelessWidget {
  Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: defaultPaddingScreen),
      child: StoreConnector<AppState, AppState>(
        builder: (context, state) {
          final subscriptions = state.subscriptions;

          if (subscriptions.isEmpty) {
            return const EmptyMessage();
          }

          return SingleChildScrollView(
            child: Column(
              children: [
                Info(),
                const SizedBox(height: 20),
                Wrapper(
                  child: ChartBar(),
                ),
                const SizedBox(height: 20),
                Wrapper(
                  child: ChartPie(),
                ),
                const SizedBox(height: 20),
              ],
            ),
          );
        },
        converter: (store) => store.state,
      ),
    );
  }
}
