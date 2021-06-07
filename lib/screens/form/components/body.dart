import 'package:flutter/material.dart';
import 'package:subscription_monitoring/components/container_image.dart';
import 'package:subscription_monitoring/components/wrapper.dart';
import 'package:subscription_monitoring/theme/constants.dart';
import 'package:subscription_monitoring/models/Subscription.dart';
import 'package:subscription_monitoring/utils/utils.dart';

class Body extends StatelessWidget {
  const Body({Key? key, required this.subscription}) : super(key: key);

  final Subscription subscription;

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
                      src: subscription.imageSrc,
                      size: 150,
                      borderRadius: 20,
                    ),
                  ),
                  const SizedBox(height: 40),
                  _buildRow('Title', Text(subscription.title)),
                  const Divider(),
                  _buildRow('Price', Text(subscription.price.toString())),
                  const Divider(),
                  _buildRow('Currency', Text('USD (\$)')),
                  const Divider(),
                  _buildRow('Period', Text('1 month')),
                  const Divider(),
                  _buildRow(
                    'Payment Date',
                    Text(
                      Utils.formatDate(
                        time: subscription.initDate,
                      ),
                    ),
                  ),
                  const Divider(),
                  _buildRow(
                    'Notify me',
                    Text('Subscribe to TV series and movies'),
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
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 17,
              color: Colors.grey,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          trailing
        ],
      ),
    );
  }
}
