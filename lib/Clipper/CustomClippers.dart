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

    Top Bezier Curve

    path.lineTo(width * 0.40, 0);
    path.quadraticBezierTo(width * 0.5, height * 0.25, width * 0.60, 0);
    path.lineTo(width, 0);
    path.lineTo(width, height);
    path.lineTo(0, height);

    path.moveTo(width * 0.5, 0);
    path.lineTo(0, height);
    path.quadraticBezierTo(width / 2, height / 2, width, height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}



///////////////// Main Code

body: Center(
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: <Widget>[
ClipPath(
clipper: HabibiClipper(),
child: Image.asset('assets/images/lady.jpeg'))
],
),
),
