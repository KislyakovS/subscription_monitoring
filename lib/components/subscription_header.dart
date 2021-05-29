import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:subscription_monitoring/colors.dart';

class SubscriptionHeader extends StatelessWidget {
  final String imageSrc;
  final double imageSize;
  final String title;
  final DateTime? date;

  const SubscriptionHeader({
    Key? key,
    required this.imageSrc,
    required this.title,
    this.imageSize = 70,
    this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildIamge(),
        const SizedBox(width: 10),
        Expanded(child: _buildTitle()),
        const SizedBox(width: 10),
        if (date != null) _buildDate(),
      ],
    );
  }

  ClipRRect _buildIamge() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Image.network(
        imageSrc,
        width: imageSize,
        height: imageSize,
        fit: BoxFit.fill,
      ),
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
    final format = DateFormat('d MMMM');

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: primaryColor.withOpacity(0.5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        '${format.format(date!)}',
        style: const TextStyle(
          fontSize: 16,
          color: primaryColor,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
