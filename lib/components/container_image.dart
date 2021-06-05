import 'package:flutter/material.dart';

class ContainerImage extends StatelessWidget {
  const ContainerImage({
    Key? key,
    required this.src,
    required this.size,
    required this.borderRadius,
  }) : super(key: key);

  final String src;
  final double size;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Image.network(
        src,
        width: size,
        height: size,
        fit: BoxFit.fill,
      ),
    );
  }
}
