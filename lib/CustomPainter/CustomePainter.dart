import 'dart:math';

import 'package:flutter/material.dart';

class ClockPainter extends CustomPainter {
  final DateTime now;

  final romanDigits = [
    'XII',
    'I',
    'II',
    'III',
    'IV',
    'V',
    'VI',
    'VII',
    'VIII',
    'IX',
    'X',
    'XI',
  ];
  final englishDigits = [
    '12',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
  ];

  ClockPainter(this.now);
  @override
  void paint(Canvas canvas, Size size) {
    const totalNoOfTicks = 60;
    const hoursNeedleColor = Colors.white;
    const minutesNeedleColor = Colors.green;
    const angleOfRotation = 2 * pi / totalNoOfTicks;
    const hoursNeedleThickness = 10.0;
    const minutesNeedleThickness = 5.0;

    final width = size.width;
    final height = size.height;
    final radius = min(width, height) / 2;
    final hoursNeedleRadius = radius * 0.2;
    final minutesNeedleRadius = radius * 0.1;
    final hoursNeedleLength = radius * 0.8;
    final minutesNeedleLength = radius * 0.9;

    final hoursTickLength = radius * 0.1;
    final minutesTickLength = radius * 0.05;
    final hoursTickStrokeWidth = radius * 0.02;
    final minutesTickStrokeWidth = radius * 0.01;
    final centerOffset = Offset(width / 2, height / 2);

    final paint = Paint()
      ..shader = const LinearGradient(colors: [Colors.black, Colors.grey])
          .createShader(Rect.fromCircle(center: centerOffset, radius: radius));
    final hoursTickPaint = Paint()
      ..color = Colors.black
      ..strokeWidth = hoursTickStrokeWidth
      ..strokeCap = StrokeCap.round;

    final minutesTickPaint = Paint()
      ..color = Colors.white
      ..strokeWidth = minutesTickStrokeWidth;

    Paint hoursNeedlePaint = Paint()
      ..color = hoursNeedleColor
      ..strokeWidth = hoursNeedleThickness
      ..strokeCap = StrokeCap.round;
    Paint minutesNeedlePaint = Paint()
      ..color = minutesNeedleColor
      ..strokeWidth = minutesNeedleThickness
      ..strokeCap = StrokeCap.round;

    // Draw Dail Of The Clock
    canvas.drawCircle(centerOffset, radius, paint);
    // Draw Ticks
    canvas.translate(centerOffset.dx, centerOffset.dy);
    canvas.save();

    for (var i = 0; i < totalNoOfTicks; i++) {
      var isHour = i % 5 == 0;
      if (isHour) {
        // Draw Hours Ticks
        canvas.drawLine(Offset(0, -radius),
            Offset(0, -radius + hoursTickLength), hoursTickPaint);

        TextPainter textPainter = TextPainter();
        textPainter.textDirection = TextDirection.ltr;
        textPainter.text = TextSpan(
            text: englishDigits[i ~/ 5],
            style: const TextStyle(color: Colors.white, fontSize: 22));
        textPainter.layout();
        textPainter.paint(canvas, Offset(-10, -radius + hoursTickLength + 10));
      } else {
        // Draw Minutes Ticks
        canvas.drawLine(Offset(0, -radius),
            Offset(0, -radius + minutesTickLength), minutesTickPaint);
      }

      if (now.second == i) {
        // Minutes Needle
        canvas.drawCircle(Offset.zero, minutesNeedleRadius, minutesNeedlePaint);
        canvas.drawLine(
            Offset.zero, Offset(0, -minutesNeedleLength), minutesNeedlePaint);
      }
      if (now.hour % 12 * 5 == i) {
        print(now.hour);
        canvas.drawCircle(Offset.zero, hoursNeedleRadius, hoursNeedlePaint);
        canvas.drawLine(
            Offset.zero, Offset(0, -hoursNeedleLength), hoursNeedlePaint);
      }

      canvas.rotate(angleOfRotation);
    }
    canvas.restore();
  }

  @override
  bool shouldRepaint(ClockPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(ClockPainter oldDelegate) => true;
}




////////////////// Main Class code here

DateTime now = DateTime.now();
@override
void initState() {
  Timer.periodic(
      const Duration(seconds: 1),
      ((timer) => setState(() {
        now = DateTime.now();
      })));
  super.initState();
}
painter: ClockPainter(now),
