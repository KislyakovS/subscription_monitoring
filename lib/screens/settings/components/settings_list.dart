import 'package:flutter/material.dart';

import '../../../components/components.dart';

class SettingsList extends StatelessWidget {
  SettingsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrapper(
      child: Column(
        children: [
          _buildRow(
            'Notifications',
            Switch.adaptive(value: true, onChanged: (_) {}),
          ),
          const Divider(),
          _buildRow(
            'Notification time',
            const Text(
              '10:10',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ),
          const Divider(),
          _buildRow(
            'Default currency',
            const Text(
              'USD (\$)',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }

  Row _buildRow(String label, Widget trailing) {
    return Row(
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
    );
  }
}
