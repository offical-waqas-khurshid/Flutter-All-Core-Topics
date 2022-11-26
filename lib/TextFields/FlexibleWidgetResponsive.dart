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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      // body: Center(
      //     child: AspectRatio(
      //   aspectRatio: 9 / 4,
      //   child: Container(
      //     color: Colors.blue,
      //   ),
      // )),
      body: OrientationBuilder(
        builder: (context, orientation) => orientation == Orientation.portrait
            ? const PortraitLayout()
            : const LandscapeLayout(),
      ),
    );
  }
}

class PortraitLayout extends StatelessWidget {
  const PortraitLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
        Expanded(
            flex: 4,
            child: Container(
              color: Colors.blue,
            )),
        Expanded(
            flex: 6,
            child: LayoutBuilder(
              builder: (context, constraints) {
                var width = constraints.maxWidth * 0.25;
                return Row(
                  children: [
                    Container(
                      color: Colors.lime,
                      width: width,
                      child: Center(
                        child: Text('Width : $width', textScaleFactor: 1.5),
                      ),
                    ),
                    Container(
                      color: Colors.lightBlue,
                      width: width,
                    ),
                    Container(
                      color: Colors.lightGreen,
                      width: width,
                    ),
                    Container(
                      color: Colors.pink,
                      width: width,
                    ),
                  ],
                );
              },
            )),
      ]),
    );
  }
}

class LandscapeLayout extends StatelessWidget {
  const LandscapeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(children: [
        Expanded(
            flex: 40,
            child: Container(
              color: Colors.blue,
            )),
        const Spacer(
          flex: 3,
        ),
        Expanded(
            flex: 57,
            child: Container(
              color: Colors.pink,
            )),
      ]),
    );
  }
}

