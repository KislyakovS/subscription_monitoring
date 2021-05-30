import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  final Widget child;
  final double padding;
  final double borderRadius;

  const Wrapper({
    Key? key,
    required this.child,
    this.padding = 20,
    this.borderRadius = 20,
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
      child: child,
    );
  }
}
