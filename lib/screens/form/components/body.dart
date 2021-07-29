import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:subscription_monitoring/components/components.dart';
import 'package:subscription_monitoring/screens/form/components/row_data_picker.dart';
import 'package:subscription_monitoring/theme/constants.dart';

import '../data.dart';
import '../form_provider.dart';
import 'row_dropdown.dart';
import 'row_text_field.dart';

class Body extends StatefulWidget {
  const Body({
    Key? key,
  }) : super(key: key);

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
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final model = FormModelProvider.read(context)?.model;
    final subscription = model!.subscription;

    title = TextEditingController(text: subscription?.title);
    price = TextEditingController(text: subscription?.price.toString());
    imageSrc = subscription?.imageSrc ?? '';
    dateStart = subscription?.initDate ?? DateTime.now();
    currency = 0;
    notification = 0;
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
          ],
        ),
      ),
    );
  }
}
