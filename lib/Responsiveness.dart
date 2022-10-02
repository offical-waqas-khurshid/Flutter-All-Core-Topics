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
    var screenSize = MediaQuery.of(context).size;
    var screenWidth = screenSize.width;
    var screenHeight = screenSize.height;
    var screenClientHeight = screenHeight - kToolbarHeight;
    var orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: orientation == Orientation.portrait
          ? VerticalLayoutWidget(
          screenClientHeight: screenClientHeight, screenWidth: screenWidth)
          : const HorizentalLayoutWidget(),
    );
  }
}

class VerticalLayoutWidget extends StatelessWidget {
  final double screenClientHeight;
  final double screenWidth;
  const VerticalLayoutWidget(
      {required this.screenClientHeight, required this.screenWidth, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: screenClientHeight * 0.3,
          color: Colors.blue,
        ),
        SizedBox(
          height: screenClientHeight * 0.7,
          child: Row(
            children: [
              Container(
                width: screenWidth * 0.4,
                color: Colors.brown,
              ),
              Container(
                width: screenWidth * 0.6,
                color: Colors.amber,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class HorizentalLayoutWidget extends StatelessWidget {
  const HorizentalLayoutWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
    );
  }
}

