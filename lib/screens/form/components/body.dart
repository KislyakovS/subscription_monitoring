import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:subscription_monitoring/components/components.dart';
import 'package:subscription_monitoring/theme/constants.dart';
import 'package:subscription_monitoring/models/Subscription.dart';

import '../data.dart';

class Body extends StatefulWidget {
  const Body({
    Key? key,
    required this.titleController,
    required this.priceController,
    required this.subscription,
  }) : super(key: key);

  final Subscription subscription;
  final TextEditingController titleController;
  final TextEditingController priceController;

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  void initState() {
    super.initState();

    widget.titleController.text = widget.subscription.title;
    widget.priceController.text = widget.subscription.price.toString();
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
                      src: widget.subscription.imageSrc,
                      size: 150,
                      borderRadius: 20,
                    ),
                  ),
                  const SizedBox(height: 40),
                  _buildRow(
                    'Title',
                    Expanded(
                      child: CupertinoTextField(
                        placeholder: 'Subscription name',
                        controller: widget.titleController,
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
                        controller: widget.priceController,
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
                      items: currencies.entries.map((e) => e.value).toList(),
                      onChanged: (value) {
                        print(value);
                      },
                    ),
                  ),
                  const Divider(),
                  _buildRow('Period', Text('1 month')),
                  const Divider(),
                  _buildRow(
                    'Payment Date',
                    PlatformDatePicker(
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2021, 1, 1),
                      lastDate: DateTime(2022, 1, 1),
                      onChangedDate: (date) {
                        print(date);
                      },
                    ),
                  ),
                  const Divider(),
                  _buildRow(
                    'Notify me',
                    PlatformDropdown(
                      items: notifications.entries.map((e) => e.value).toList(),
                      onChanged: (value) {
                        print(value);
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20)
          ],
        ),
      ),
    );
  }

  Padding _buildRow(String label, Widget trailing) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
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

  // static Route<void> _modalBuilder(BuildContext context, Object? arguments) {
  //   return CupertinoModalPopupRoute<void>(
  //     builder: (BuildContext context) {
  //       return CupertinoActionSheet(
  //         title: const Text('Title'),
  //         message: const Text('Message'),
  //         actions: <CupertinoActionSheetAction>[
  //           CupertinoActionSheetAction(
  //             child: const Text('Action One'),
  //             onPressed: () {
  //               Navigator.pop(context);
  //             },
  //           ),
  //           CupertinoActionSheetAction(
  //             child: const Text('Action Two'),
  //             onPressed: () {
  //               Navigator.pop(context);
  //             },
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  static Route<void> _modalBuilder(BuildContext context, Object? arguments) {
    return CupertinoModalPopupRoute<void>(
      builder: (BuildContext context) {
        return CupertinoDatePicker(
          onDateTimeChanged: (DateTime value) {},
        );
      },
    );
  }
}
