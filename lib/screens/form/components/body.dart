import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:subscription_monitoring/components/components.dart';
import 'package:subscription_monitoring/models/Templates.dart';
import 'package:subscription_monitoring/redux/actions/subscriptions_actions.dart';
import 'package:subscription_monitoring/redux/store/store.dart';
import 'package:subscription_monitoring/screens/bottom_navigation/bottom_navigation_screen.dart';
import 'package:subscription_monitoring/theme/constants.dart';
import 'package:subscription_monitoring/models/Subscription.dart';

import '../data.dart';

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
  late int currencie;
  late int notification;

  @override
  void initState() {
    super.initState();

    if (widget.subscription != null) {
      title = TextEditingController(text: widget.subscription!.title);
      price =
          TextEditingController(text: widget.subscription!.price.toString());
      imageSrc = widget.subscription!.imageSrc;
      currencie = 0;
      notification = 0;
    } else {
      title = TextEditingController(text: widget.template!.title);
      price = TextEditingController(text: '');
      imageSrc = widget.template!.imageSrc;
      currencie = 0;
      notification = 0;
    }
  }

  void _onTapSubmit() {
    final store = StoreProvider.of<AppState>(context);

    var subscription = Subscription(
      id: 100,
      imageSrc: imageSrc,
      title: title.text,
      startDate: DateTime.now(),
      endDate: DateTime.now(),
      initDate: DateTime.now(),
      price: double.parse(price.text),
    );

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
                  _buildRow(
                    'Title',
                    Expanded(
                      child: CupertinoTextField(
                        placeholder: 'Subscription name',
                        controller: title,
                        style: style,
                        textAlign: TextAlign.right,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.transparent),
                        ),
                      ),
                    ),
                  ),
                  const Divider(),
                  _buildRow(
                    'Price',
                    Expanded(
                      child: CupertinoTextField(
                        placeholder: '9.99',
                        keyboardType: TextInputType.number,
                        controller: price,
                        style: style,
                        textAlign: TextAlign.right,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.transparent),
                        ),
                      ),
                    ),
                  ),
                  const Divider(),
                  _buildRow(
                    'Currency',
                    PlatformDropdown(
                      initialIndex: currencie,
                      items: currencies.entries.map((e) => e.value).toList(),
                      style: style,
                      onChanged: (index) {
                        setState(() {
                          currencie = index;
                        });
                      },
                    ),
                  ),
                  const Divider(),
                  _buildRow(
                    'Period',
                    Text(
                      '1 month',
                      style: style,
                    ),
                  ),
                  const Divider(),
                  _buildRow(
                    'Payment Date',
                    PlatformDatePicker(
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2021, 1, 1),
                      lastDate: DateTime(2022, 1, 1),
                      style: style,
                      onChangedDate: (date) {
                        print(date);
                      },
                    ),
                  ),
                  const Divider(),
                  _buildRow(
                    'Notify me',
                    PlatformDropdown(
                      initialIndex: notification,
                      items: notifications.entries.map((e) => e.value).toList(),
                      style: style,
                      onChanged: (index) {
                        setState(() {
                          notification = index;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              child: ButtonText(
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

  SizedBox _buildRow(String label, Widget trailing) {
    return SizedBox(
      height: 30,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 17,
              color: Colors.grey,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(width: 10),
          trailing,
        ],
      ),
    );
  }
}
