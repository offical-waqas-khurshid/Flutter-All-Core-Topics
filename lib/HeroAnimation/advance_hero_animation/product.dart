import 'dart:ui';

import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //     backgroundColor: Colors.black,
      body: Center(
        child: Hero(
          tag: 'Second',
          createRectTween: _createRectTween,
          child: Container(
            color: Colors.black,
            width: double.infinity,
            height: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Second Page',
                  style: Theme.of(context)
                      .textTheme
                      .headline3!
                      .copyWith(color: Colors.white),
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Close'))
              ],
            ),
          ),
        ),
      ),
    );
  }

  static Tween<Rect?> _createRectTween(Rect? begin, Rect? end) {
    return CircularRectTween(begin: begin!, end: end!);
  }
}

class CircularRectTween extends Tween<Rect> {
  CircularRectTween({required Rect begin, required Rect end})
      : super(begin: begin, end: end);
  @override
  Rect lerp(double t) {
    double widthCenter = begin!.left + (begin!.width / 2);
    double heightCenter = begin!.top + (begin!.height / 2);
    double? radius = lerpDouble( begin!.width, end!.width, t);
    print('width : $widthCenter Height : $heightCenter  Radius : $radius');
    return Rect.fromCircle(
        center: Offset(widthCenter, heightCenter), radius: radius!);
  }
}
