import 'package:flutter/material.dart';

class LinePercent extends StatelessWidget {
  final Color fillColor;
  final Color lineColor;
  final double strokeWidth;
  final double procent;

  const LinePercent({
    Key? key,
    required this.fillColor,
    required this.lineColor,
    this.strokeWidth = 5,
    this.procent = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: Painter(
        fillColor: fillColor,
        lineColor: lineColor,
        strokeWidth: strokeWidth,
        procent: procent,
      ),
    );
  }
}

class Painter extends CustomPainter {
  final Color fillColor;
  final Color lineColor;
  final double strokeWidth;
  final double procent;

  const Painter({
    required this.fillColor,
    required this.lineColor,
    required this.strokeWidth,
    required this.procent,
  });

  @override
  void paint(Canvas canvas, Size size) {
    drawBackgroundLine(canvas, size);
    drawLine(canvas, size);
  }

  void drawBackgroundLine(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = fillColor;
    paint.strokeCap = StrokeCap.round;
    paint.strokeWidth = strokeWidth;

    canvas.drawLine(const Offset(0, 0), Offset(size.width, 0), paint);
  }

  void drawLine(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = lineColor;
    paint.strokeCap = StrokeCap.round;
    paint.strokeWidth = strokeWidth;

    canvas.drawLine(const Offset(0, 0), Offset(size.width * procent, 0), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
