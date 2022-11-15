import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final tween = Tween<double>(begin: 0, end: 2 * pi);

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
            TweenAnimationBuilder<double>(
              tween: tween,
              duration: const Duration(seconds: 1),
              builder: (context, value, child) =>
                  Transform.rotate(
                    angle: value,
                    child: child,
                  ),
              child: Container(
                color: Colors.blue,
                child: const Text('Pakistan'),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {

          });
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}


import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double sliderValue = 0;
  Color newColor = Colors.white;

  late ColorTween tween;

  @override
  Widget build(BuildContext context) {
    tween = ColorTween(begin: Colors.white, end: newColor);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        children: [
          SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Image.asset('assets/images/galaxy.jpg', fit: BoxFit.fill)),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TweenAnimationBuilder(
                tween: tween,
                duration: const Duration(seconds: 2),
                builder: (context, value, child) =>
                    ColorFiltered(
                      colorFilter:
                      ColorFilter.mode((value as Color), BlendMode.color),
                      child: child,
                    ),
                child: Image.asset('assets/images/lady.jpeg'),
              ),

              // SizedBox(
              //   height: 200,
              //   width: 200,
              //   child: ColorFiltered(
              //     colorFilter:
              //         const ColorFilter.mode(Colors.brown, BlendMode.darken),
              //     child: Image.asset('assets/images/lady.jpeg'),
              //   ),
              // ),
              Slider(
                value: sliderValue,
                onChanged: (value) =>
                    setState(() {
                      sliderValue = value;
                      newColor = Color.lerp(Colors.white, Colors.red, value)!;
                    }),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Tween<double> tween;
  double end = 0;

  @override
  Widget build(BuildContext context) {
    tween = Tween<double>(begin: 1, end: end);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TweenAnimationBuilder<double>(
              tween: tween,
              duration: const Duration(seconds: 2),
              builder: (context, value, child) =>
                  Opacity(
                    opacity: value,
                    child: child,
                  ),
              child: Container(
                color: Colors.amber,
                height: 100,
              ),
            ),
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              'Counter',
              style: Theme
                  .of(context)
                  .textTheme
                  .headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            end = end == 1 ? 0 : 1;
          });
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

