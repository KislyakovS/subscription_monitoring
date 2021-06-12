import 'package:flutter/material.dart';
import 'package:subscription_monitoring/models/Templates.dart';
import 'package:subscription_monitoring/theme/constants.dart';

import '../../../components/components.dart';
import '../../screens.dart';

class Body extends StatelessWidget {
  Body({Key? key}) : super(key: key);

  void _onTapSubscription(BuildContext context, Template? template) {
    Navigator.pushNamed(context, FormScreen.routeName,
        arguments: FormArguments(template: template)
        //arguments: FormArguments(subscription: subscription),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: defaultPaddingScreen),
      child: ListView.separated(
        itemBuilder: (context, i) {
          if (i == 0) {
            return BouncingButton(
              press: () => _onTapSubscription(context, null),
              child: const Wrapper(
                padding: 15,
                child: SubscriptionHeader(
                  title: 'Add new subscription',
                  imageSrc: 'https://i.dlpng.com/static/png/94951_preview.png',
                  imageSize: 60,
                ),
              ),
            );
          }

          final index = i - 1;

          if (index == demoTemplates.length) {
            return const SizedBox(height: 20);
          }

          return BouncingButton(
            press: () => _onTapSubscription(context, demoTemplates[index]),
            child: Wrapper(
              padding: 15,
              child: SubscriptionHeader(
                title: demoTemplates[index].title,
                imageSrc: demoTemplates[index].imageSrc,
                imageSize: 60,
              ),
            ),
          );
        },
        separatorBuilder: (context, _) => const SizedBox(height: 15),
        itemCount: demoTemplates.length + 2,
      ),
    );
  }
}
