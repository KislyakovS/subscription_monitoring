import 'package:flutter/material.dart';
import 'package:subscription_monitoring/models/Templates.dart';
import 'package:subscription_monitoring/screens/list_subscription/list_subscription_provider.dart';
import 'package:subscription_monitoring/theme/constants.dart';

import '../../../components/components.dart';

class Body extends StatelessWidget {
  Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = ListSubscriptionModelProvider.read(context)?.model;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: defaultPaddingScreen),
      child: ListView.separated(
        itemBuilder: (context, i) {
          if (i == demoTemplates.length) {
            return const SizedBox(height: 20);
          }

          return GestureDetector(
            onTap: () => model?.showDetails(context, demoTemplates[i]),
            child: Wrapper(
              padding: 15,
              child: SubscriptionHeader(
                title: demoTemplates[i].title,
                imageSrc: demoTemplates[i].imageSrc,
                imageSize: 60,
              ),
            ),
          );
        },
        separatorBuilder: (context, _) => const SizedBox(height: 15),
        itemCount: demoTemplates.length + 1,
      ),
    );
  }
}
