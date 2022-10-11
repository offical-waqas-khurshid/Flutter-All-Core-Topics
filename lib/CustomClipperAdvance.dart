import 'dart:math';

import 'package:flutter/rendering.dart';

class HabibiClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var width = size.width;
    var height = size.height;

    Path path = Path();
    path.moveTo(width * 0.5, 0);
    path.lineTo(0, height);
    path.lineTo(width, height);
    path.close();

    Left Side Bezier Curve

    path.quadraticBezierTo(width * 0.20, height * 0.5, 0, height);
    path.lineTo(width, height);
    path.lineTo(width, 0);

    // Top Bezier Curve
    final dha = height * 0.3;
    path.moveTo(0, 0);
    path.lineTo(width * 0.25, 0);
    path.quadraticBezierTo(width * 0.5, height * 0.50, width * 0.75, 0);
    path.conicTo(width * 0.5, height * 0.50, width * 0.75, 0, 1);
    path.cubicTo(width * 0.25, height * 0.5, width * .75, 0, width * 0.8, dha);
    path.arcTo(Rect.fromLTWH(0, 0, width, height), degToRadian(0),
        degToRadian(270), false);
     path.lineTo(width, 0);
     path.lineTo(width, height);
     path.lineTo(0, height);

    path.moveTo(width * 0.5, 0);
    path.lineTo(0, height);
    path.quadraticBezierTo(width / 2, height / 2, width, height);

    var oval = Rect.fromLTWH(width * 0.35, 0, width, height);
    var oval2 = Rect.fromLTWH(0, 0, width * 0.3, height * 0.3);
    var rect = Rect.fromLTWH(0, height * 0.5, width * 0.35, height * 0.5);
    path.addArc(oval, degToRadian(0), degToRadian(270));
    path.addOval(oval2);
    path.addRect(rect);
    var points = <Offset>[
      const Offset(0, 0),
      Offset(width * 0.5, 0),
      Offset(0, height * 0.5),
      Offset(width * 0.5, height),
      Offset(0, height),
      const Offset(0, 0)
    ];
    path.addPolygon(points, true);
    path.close();
    return path;
  }

  double degToRadian(double deg) => pi * deg / 180;
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}