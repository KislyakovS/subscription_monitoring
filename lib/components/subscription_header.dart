import 'package:flutter/material.dart';
import 'package:subscription_monitoring/theme/colors.dart';
import 'package:subscription_monitoring/components/container_image.dart';
import 'package:subscription_monitoring/models/Subscription.dart';
import 'package:subscription_monitoring/utils/utils.dart';

class SubscriptionHeader extends StatelessWidget {
  final Subscription subscription;
  final double imageSize;
  final double borderRadius;
  final bool isShowDate;

  const SubscriptionHeader({
    Key? key,
    required this.subscription,
    this.borderRadius = 15,
    this.imageSize = 70,
    this.isShowDate = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ContainerImage(
          src: subscription.imageSrc,
          size: imageSize,
          borderRadius: borderRadius,
        ),
        const SizedBox(width: 10),
        Expanded(child: _buildTitle()),
        const SizedBox(width: 10),
        if (isShowDate) _buildDate(),
      ],
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
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: primaryColor.withOpacity(0.5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        '${Utils.formatDate(time: subscription.endDate)}',
        style: const TextStyle(
          fontSize: 16,
          color: primaryColor,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
