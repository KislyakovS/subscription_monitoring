import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:subscription_monitoring/components/components.dart';

class RowDropdown extends StatelessWidget {
  const RowDropdown({
    Key? key,
    required this.label,
    required this.initialIndex,
    required this.items,
    required this.onChanged,
  }) : super(key: key);

  final String label;
  final int initialIndex;
  final List<String> items;
  final void Function(int) onChanged;

  @override
  Widget build(BuildContext context) {
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
          PlatformDropdown(
            initialIndex: initialIndex,
            items: items,
            style: const TextStyle(fontSize: 16),
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
