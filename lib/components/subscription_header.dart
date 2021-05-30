import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:subscription_monitoring/colors.dart';
import 'package:subscription_monitoring/models/Subscription.dart';

class SubscriptionHeader extends StatelessWidget {
  final Subscription subscription;
  final double imageSize;
  final bool isShowDate;

  const SubscriptionHeader({
    Key? key,
    required this.subscription,
    this.imageSize = 70,
    this.isShowDate = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildIamge(),
        const SizedBox(width: 10),
        Expanded(child: _buildTitle()),
        const SizedBox(width: 10),
        if (isShowDate) _buildDate(),
      ],
    );
  }

  ClipRRect _buildIamge() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Image.network(
        subscription.imageSrc,
        width: imageSize,
        height: imageSize,
        fit: BoxFit.fill,
      ),
    );
  }

  Text _buildTitle() {
    return Text(
      subscription.title,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(
        fontSize: 23,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Container _buildDate() {
    final format = DateFormat('d MMMM');

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: primaryColor.withOpacity(0.5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        '${format.format(subscription.endDate)}',
        style: const TextStyle(
          fontSize: 16,
          color: primaryColor,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
