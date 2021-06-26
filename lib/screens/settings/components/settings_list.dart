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
            0,
            Switch.adaptive(value: true, onChanged: (_) {}),
          ),
          const Divider(),
          _buildRow(
            'Notification time',
            7,
            const Text(
              '10:10',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ),
          const Divider(),
          _buildRow(
            'Default currency',
            7,
            const Text(
              'USD (\$)',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRow(String label, double padding, Widget trailing) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: padding),
      child: Row(
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
      ),
    );
  }
}
