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

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var random = Random(0xffffffff);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: GridView.custom(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4), childrenDelegate: SliverChildBuilderDelegate((context, index) => Container(
        color: Color(random.nextInt(0xffffffff)),
        child: Center(
          child: Text('Index:$index'),
        ),
      ),)),

      GridView(gridDelegate: gridDelegate,children: []),

       GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 100),
          itemBuilder: (context, index) => Container(
                color: Color(random.nextInt(0xffffffff)),
                child: Center(
                  child: Text('Index:$index'),
                ),
              ))
      GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4), itemBuilder: (context, index) => Container(
                  color: Color(random.nextInt(0xffffffff)),
                  child: Center(child: Text('Index: $index')),
                ),)
      GridView.extent(
        maxCrossAxisExtent: 200,
        children: List.generate(
            100,
            (index) => Container(
                  color: Color(random.nextInt(0xffffffff)),
                  child: Center(child: Text('Index: $index')),
                )),
      )
       GridView.count(
          crossAxisCount: 4,
      children: List.generate(
          100,
          (index) => Container(
                color: Color(random.nextInt(0xffffffff)),
                child: Center(child: Text('Index: $index')),
              ))),
    );
  }
}

