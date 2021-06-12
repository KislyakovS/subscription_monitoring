import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RowTextField extends StatelessWidget {
  const RowTextField({
    Key? key,
    required this.label,
    required this.controller,
    required this.placeholder,
  }) : super(key: key);

  final String label;
  final TextEditingController controller;
  final String placeholder;

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
          Expanded(
            child: CupertinoTextField(
              placeholder: placeholder,
              controller: controller,
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.right,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.transparent),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
