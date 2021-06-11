import 'package:flutter/material.dart';
import 'package:subscription_monitoring/theme/colors.dart';
import 'package:subscription_monitoring/components/container_image.dart';
import 'package:subscription_monitoring/utils/utils.dart';

class SubscriptionHeader extends StatelessWidget {
  //final Subscription subscription;
  final String title;
  final String imageSrc;
  final DateTime? date;
  final double imageSize;
  final double borderRadius;

  const SubscriptionHeader({
    Key? key,
    required this.title,
    required this.imageSrc,
    this.date,
    this.borderRadius = 15,
    this.imageSize = 70,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ContainerImage(
          src: imageSrc,
          size: imageSize,
          borderRadius: borderRadius,
        ),
        const SizedBox(width: 10),
        Expanded(child: _buildTitle()),
        const SizedBox(width: 10),
        if (date != null) _buildDate(),
      ],
    );
  }

  Text _buildTitle() {
    return Text(
      title,
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
        '${Utils.formatDate(time: date!)}',
        style: const TextStyle(
          fontSize: 16,
          color: primaryColor,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
