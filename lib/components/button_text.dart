import 'package:flutter/material.dart';

import 'components.dart';

class ButtonText extends StatelessWidget {
  const ButtonText({
    Key? key,
    required this.title,
    required this.press,
    this.buttonColor = Colors.white,
    this.textColor = Colors.black,
  }) : super(key: key);

  final String title;
  final Color buttonColor;
  final Color textColor;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return BouncingButton(
      press: press,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: buttonColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 2),
            )
          ],
        ),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(color: textColor, fontSize: 18),
        ),
      ),
    );
  }
}
