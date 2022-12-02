import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animatedbuilder/animated_logo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final tween = Tween<double>(begin: 0, end: 2 * pi);
  late Animation _animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _animation = tween.animate(_controller);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) => Transform.rotate(
                angle: _animation.value,
                child: child,
              ),
              child: const FlutterLogo(),
            ),
            AnimatedLogo(animation: _animation, child: const FlutterLogo()),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _controller.forward();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}


import 'package:flutter/widgets.dart';

class AnimatedLogo extends AnimatedWidget {
  //AnimatedLogo({required super.listenable});
  late Animation animation;
  Widget child;
  AnimatedLogo({required this.animation, required this.child})
      : super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: animation.value,
      child: child,
    );
  }
}

