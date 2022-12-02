import 'dart:math';

import 'package:flutter/material.dart';

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
  late Animation<double> _fadeAnimation;
  late Animation<double> _rotateAnimation;
  late Animation<double> _scaleAnimation;

  final fadeTween = Tween<double>(begin: 1, end: 0);
  final rotateTween = Tween<double>(begin: 0, end: 2 * pi);
  final scaleTween = Tween<double>(begin: 1, end: 2);

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _scaleAnimation = scaleTween.animate(CurvedAnimation(
        parent: _controller,
        curve: const Interval(0, 0.33, curve: Curves.bounceInOut)));
    _rotateAnimation = rotateTween.animate(CurvedAnimation(
        parent: _controller, curve: const Interval(0.33, 0.66)));
    _fadeAnimation = fadeTween.animate(
        CurvedAnimation(parent: _controller, curve: const Interval(0.66, 1)));
  }

  @override
  Widget build(BuildContext context) {
    var image = Image.asset(
      'assets/image/bigburger.png',
      fit: BoxFit.cover,
      height: 200,
      width: 200,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ScaleTransition(
              scale: _scaleAnimation,
              child: image,
            ),
            RotationTransition(
              turns: _rotateAnimation,
              child: image,
            ),
            FadeTransition(
              opacity: _fadeAnimation,
              child: image,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _controller.repeat();
          });
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}