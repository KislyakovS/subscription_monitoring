import 'package:flutter/material.dart';
import 'package:subscription_monitoring/components/components.dart';

class Chart extends StatelessWidget {
  const Chart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrapper(
      child: ChartBar(),
    );
  }
}
