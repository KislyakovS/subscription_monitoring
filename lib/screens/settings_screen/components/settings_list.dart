import 'package:flutter/material.dart';
import 'package:subscription_monitoring/components/platform_switch.dart';
import 'package:subscription_monitoring/components/wrapper.dart';

class SettingsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrapper(
      child: Column(
        children: [
          _buildRow(
            'Notifications',
            PlatformSwitch(
              value: true,
              onChanged: (_) {},
            ),
          ),
          Divider(),
          _buildRow(
            'Notification time',
            Text(
              '10:10',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ),
          Divider(),
          _buildRow(
              'Default currency',
              Text(
                'USD (\$)',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              )),
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
