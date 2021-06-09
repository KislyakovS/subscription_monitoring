import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:subscription_monitoring/models/Subscription.dart';
import 'package:subscription_monitoring/redux/actions/subscriptions_actions.dart';
import 'package:subscription_monitoring/redux/store/store.dart';
import 'package:subscription_monitoring/screens/screens.dart';

import 'components/body.dart';

class FormScreen extends StatefulWidget {
  static String routeName = '/form';

  FormScreen({Key? key}) : super(key: key);

  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final titleController = TextEditingController();
  final priceController = TextEditingController();

  int currencie = 0;
  int notification = 0;

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      final arguments =
          ModalRoute.of(context)!.settings.arguments as FormArguments;

      titleController.text = arguments.subscription.title;
      priceController.text = arguments.subscription.price.toString();

      setState(() {
        currencie = 1;
        notification = 1;
      });
    });
  }

  void _onTapSave(BuildContext context) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as FormArguments;
    final store = StoreProvider.of<AppState>(context);

    var subscription = Subscription(
      id: 100,
      imageSrc:
          'https://store-images.s-microsoft.com/image/apps.18232.9007199266245457.8b09e203-e0a1-4543-bb73-5726a7b85171.fa748e0d-f1c4-4ef5-811d-fcb05ff18580?mode=scale&q=90&h=300&w=300',
      title: titleController.text,
      endDate: DateTime.now(),
      initDate: DateTime.now(),
      price: double.parse(priceController.text),
      startDate: DateTime.now(),
    );

    if (arguments.isUpdate) {
      store.dispatch(UpdateSubscription(
        id: arguments.subscription.id,
        subscription: subscription,
      ));
    } else {
      store.dispatch(AddSubscription(subscription: subscription));
    }

    Navigator.pushNamedAndRemoveUntil(
        context, ButtomNavigationScreen.routeName, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as FormArguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          arguments.subscription.title,
          style: const TextStyle(color: Colors.black),
        ),
      ),
      body: Body(
        subscription: arguments.subscription,
      ),
    );
  }
}

class FormArguments {
  final Subscription subscription;
  final bool isUpdate;

  FormArguments({required this.subscription, this.isUpdate = false});
}
