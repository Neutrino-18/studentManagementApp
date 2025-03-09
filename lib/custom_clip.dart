import 'package:flutter/material.dart';

class MyCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.yellow
      ..style = PaintingStyle.fill;
    Path path = Path();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
