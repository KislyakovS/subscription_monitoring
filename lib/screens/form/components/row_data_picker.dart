import 'package:flutter/material.dart';
import 'package:subscription_monitoring/components/components.dart';

class RowDataPicker extends StatelessWidget {
  const RowDataPicker({
    Key? key,
    required this.label,
    required this.initialDate,
    required this.onChangedDate,
  }) : super(key: key);

  final String label;
  final DateTime initialDate;
  final void Function(DateTime) onChangedDate;

  @override
  Widget build(BuildContext context) {
    final date = DateTime.now();
    final firstDate = DateTime(date.year, date.month, date.day);
    final lastDate = DateTime(date.year + 5, date.month, date.day);

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
          PlatformDatePicker(
            initialDate: initialDate,
            firstDate: firstDate,
            lastDate: lastDate,
            style: const TextStyle(fontSize: 16),
            onChangedDate: onChangedDate,
          ),
        ],
      ),
    );
  }
}
