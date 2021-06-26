import 'package:flutter/material.dart';
import 'package:subscription_monitoring/theme/colors.dart';

class Wrapper extends StatelessWidget {
  final Widget child;
  final double padding;
  final double borderRadius;
  final String? title;
  final String? DefaultButton;
  final void Function()? press;

  const Wrapper({
    Key? key,
    required this.child,
    this.padding = 20,
    this.borderRadius = 20,
    this.title,
    this.DefaultButton,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          )
        ],
      ),
      child: Column(
        children: [
          if (title != null || DefaultButton != null) _buildContainerHeader(),
          child
        ],
      ),
    );
  }

  Row _buildContainerHeader() {
    return Row(children: [
      if (title != null)
        Text(
          title!,
          style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
        ),
      const Spacer(),
      if (DefaultButton != null)
        TextButton(
          onPressed: press,
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all<Color>(
              primaryColor.withOpacity(0.4),
            ),
          ),
          child: Text(
            DefaultButton!,
            style: const TextStyle(color: primaryColor, fontSize: 16),
          ),
        )
    ]);
  }
}
