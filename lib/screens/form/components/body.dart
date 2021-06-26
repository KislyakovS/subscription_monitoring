import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:subscription_monitoring/components/components.dart';
import 'package:subscription_monitoring/models/Templates.dart';
import 'package:subscription_monitoring/redux/actions/subscriptions_actions.dart';
import 'package:subscription_monitoring/redux/store/store.dart';
import 'package:subscription_monitoring/screens/bottom_navigation/bottom_navigation_screen.dart';
import 'package:subscription_monitoring/screens/form/components/row_data_picker.dart';
import 'package:subscription_monitoring/theme/constants.dart';
import 'package:subscription_monitoring/models/Subscription.dart';
import 'package:subscription_monitoring/utils/utils.dart';

import '../data.dart';
import 'row_dropdown.dart';
import 'row_text_field.dart';

class Body extends StatefulWidget {
  const Body({
    Key? key,
    required this.subscription,
    required this.template,
    required this.isUpdate,
  }) : super(key: key);

  final Subscription? subscription;
  final Template? template;
  final bool isUpdate;

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TextStyle style = const TextStyle(fontSize: 16);

  late final TextEditingController title;
  late final TextEditingController price;
  late String imageSrc;
  late DateTime dateStart;
  late int currency;
  late int notification;

  @override
  void initState() {
    super.initState();

    if (widget.subscription != null) {
      title = TextEditingController(text: widget.subscription!.title);
      price =
          TextEditingController(text: widget.subscription!.price.toString());
      imageSrc = widget.subscription!.imageSrc;
      dateStart = widget.subscription!.initDate;
      currency = 0;
      notification = 0;
    } else {
      title = TextEditingController(text: widget.template!.title);
      price = TextEditingController(text: '');
      imageSrc = widget.template!.imageSrc;
      dateStart = DateTime.now();
      currency = 0;
      notification = 0;
    }
  }

  Subscription _getNewSubscription() {
    final diffDays = dateStart.difference(DateTime.now()).inDays;
    final startDate = diffDays > 0
        ? Utils.addMonth(count: -1, currentDate: dateStart)
        : dateStart;
    final endDate = diffDays > 0
        ? dateStart
        : Utils.addMonth(count: 1, currentDate: dateStart);

    return Subscription(
      id: Random().nextInt(500),
      imageSrc: imageSrc,
      title: title.text,
      startDate: startDate,
      endDate: endDate,
      initDate: dateStart,
      price: double.parse(price.text),
    );
  }

  void _onTapSubmit() {
    final store = StoreProvider.of<AppState>(context);

    var subscription = _getNewSubscription();

    if (widget.isUpdate) {
      store.dispatch(UpdateSubscription(
          id: widget.subscription!.id, subscription: subscription));
      Navigator.of(context).pop();
    } else {
      store.dispatch(AddSubscription(subscription: subscription));
      Navigator.of(context).pushNamedAndRemoveUntil(
          ButtomNavigationScreen.routeName, (route) => false);
    }
  }

  @override
  void dispose() {
    title.dispose();
    price.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultPaddingScreen),
        child: Column(
          children: [
            Wrapper(
              child: Column(
                children: [
                  Align(
                    child: ContainerImage(
                      src: imageSrc,
                      size: 140,
                      borderRadius: 20,
                    ),
                  ),
                  const SizedBox(height: 30),
                  RowTextField(
                    label: 'Title',
                    controller: title,
                    placeholder: 'Subscription name',
                  ),
                  const Divider(),
                  RowTextField(
                    label: 'Price',
                    controller: price,
                    placeholder: '9.99',
                    formatters: [FilteringTextInputFormatter.digitsOnly],
                  ),
                  const Divider(),
                  RowDropdown(
                    label: 'Currency',
                    initialIndex: currency,
                    items: currencies.entries.map((e) => e.value).toList(),
                    onChanged: (index) {
                      setState(() {
                        currency = index;
                      });
                    },
                  ),
                  const Divider(),
                  RowTextField(
                    label: 'Period',
                    controller: TextEditingController(text: '1 month'),
                    placeholder: '',
                  ),
                  const Divider(),
                  RowDataPicker(
                    label: 'Payment Date',
                    initialDate: dateStart,
                    onChangedDate: (date) {
                      setState(() {
                        dateStart = date;
                      });
                    },
                  ),
                  const Divider(),
                  RowDropdown(
                    label: 'Notify me',
                    initialIndex: notification,
                    items: notifications.entries.map((e) => e.value).toList(),
                    onChanged: (index) {
                      setState(() {
                        notification = index;
                      });
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              child: DefaultButton(
                press: _onTapSubmit,
                title: widget.isUpdate ? 'Update' : 'Save',
              ),
            ),
            const SizedBox(height: 20)
          ],
        ),
      ),
    );
  }
}
