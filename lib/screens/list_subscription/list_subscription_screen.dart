import 'package:flutter/material.dart';

import 'components/body.dart';
import 'list_subscription_model.dart';
import 'list_subscription_provider.dart';

class ListSubscriptionScreen extends StatelessWidget {
  static String routeName = '/list_subscription';

  final _model = ListSubscriptionModel();

  ListSubscriptionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListSubscriptionModelProvider(
      model: _model,
      child: Scaffold(
        appBar: const _AppBar(),
        body: Body(),
      ),
    );
  }
}

class _AppBar extends StatelessWidget implements PreferredSizeWidget {
  const _AppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    final model = ListSubscriptionModelProvider.read(context)?.model;

    return AppBar(
      title: const Text(
        'New Subscription',
        style: TextStyle(color: Colors.black),
      ),
      actions: [
        IconButton(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onPressed: () => model?.showDetails(context, null),
          icon: const Icon(Icons.add, size: 32),
        ),
        const SizedBox(width: 10),
      ],
    );
  }
}
