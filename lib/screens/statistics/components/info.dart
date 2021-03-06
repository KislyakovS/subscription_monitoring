import 'package:flutter/material.dart';

import '../../../components/components.dart';

class Info extends StatelessWidget {
  Info({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrapper(
      child: Column(
        children: [
          _buildRow('All subscriptions', '4'),
          const Divider(),
          _buildRow('Total', '\$ 499'),
          const Divider(),
          _buildRow('Most expensive \'Netflix\'', '\$ 12.99'),
        ],
      ),
    );
  }

  Row _buildRow(String label, String value) {
    return Row(children: [
      Text(
        label,
        style: const TextStyle(
          fontSize: 17,
          color: Colors.grey,
          fontWeight: FontWeight.w500,
        ),
      ),
      const Spacer(),
      Text(
        value,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      )
    ]);
  }
}
