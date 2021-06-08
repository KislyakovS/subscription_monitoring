import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:subscription_monitoring/components/container_image.dart';
import 'package:subscription_monitoring/components/wrapper.dart';
import 'package:subscription_monitoring/theme/constants.dart';
import 'package:subscription_monitoring/models/Subscription.dart';
import 'package:subscription_monitoring/utils/utils.dart';

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
                    CupertinoTextField(
                      placeholder: 'Subscription name',
                      controller: widget.titleController,
                      textAlign: TextAlign.right,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.transparent),
                      ),
                    ),
                  ),
                  const Divider(),
                  _buildRow(
                    'Price',
                    CupertinoTextField(
                      placeholder: '9.99',
                      controller: widget.priceController,
                      textAlign: TextAlign.right,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.transparent),
                      ),
                    ),
                  ),
                  const Divider(),
                  _buildRow('Currency', Text('USD (\$)')),
                  const Divider(),
                  _buildRow('Period', Text('1 month')),
                  const Divider(),
                  _buildRow(
                    'Payment Date',
                    Text(
                      Utils.formatDate(
                        time: widget.subscription.initDate,
                      ),
                    ),
                  ),
                  const Divider(),
                  _buildRow(
                    'Notify me',
                    Text('Yes'),
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
          Expanded(
            child: trailing,
          )
        ],
      ),
    );
  }
}
