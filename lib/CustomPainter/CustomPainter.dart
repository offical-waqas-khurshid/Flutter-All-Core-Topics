import 'dart:math';

import 'package:flutter/material.dart';

class SmilyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final width = size.width;
    final height = size.height;
    final radius = min(width, height) / 2;
    final centerOffset = Offset(width / 2, height / 2);
    final facePaint = Paint()
      ..color = Colors.amber
      ..strokeWidth = 20
      ..strokeCap = StrokeCap.square
      ..strokeJoin = StrokeJoin.round
      ..shader = const LinearGradient(
          colors: [Colors.amber, Colors.red, Colors.brown],
          stops: [0.33, 0.66, 1])
          .createShader(Rect.fromLTWH(0, 0, width, height))
      ..style = PaintingStyle.stroke;
    // canvas.drawCircle(centerOffset, radius, facePaint);
    canvas.drawLine(centerOffset, Offset.zero, facePaint);
    canvas.drawRect(
        Rect.fromCircle(center: centerOffset, radius: radius / 2), facePaint);
  }

  @override
  bool shouldRepaint(SmilyPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(SmilyPainter oldDelegate) => false;
}


Main


CustomPaint(
painter: SmilyPainter(),
child: const SizedBox(
width: 400,
height: 400,
),
),
