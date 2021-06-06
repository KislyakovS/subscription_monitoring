import 'package:flutter/material.dart';
import 'package:subscription_monitoring/components/components.dart';

class Buttons extends StatelessWidget {
  const Buttons({Key? key, required this.onTapEdit, required this.onTapRemove})
      : super(key: key);

  final VoidCallback onTapEdit;
  final VoidCallback onTapRemove;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ButtonText(
            press: onTapEdit,
            title: 'Edit',
          ),
        ),
        const SizedBox(width: 15),
        Expanded(
          child: ButtonText(
            press: onTapRemove,
            buttonColor: Colors.red,
            textColor: Colors.white,
            title: 'Remove',
          ),
        )
      ],
    );
  }
}
