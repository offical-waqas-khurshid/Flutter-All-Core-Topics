
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
  var list = List.generate(100, (index) => 'Index :$index');
  late ScrollController _scrollController;
  static const listItemExten = 50.0;
  Color floatingColor = Colors.blue;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      setState(() {
        if (_scrollController.position.userScrollDirection ==
            ScrollDirection.forward) {
          floatingColor = Colors.red;
          print('Red : ${_scrollController.position}');
        } else {
          floatingColor = Colors.blue;
          print('Blue');
        }
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.custom(
          itemExtent: listItemExten,
          controller: _scrollController,
          childrenDelegate: SliverChildBuilderDelegate(
                  (context, index) => ListTile(title: Text('Index : $index')),
              childCount: list.length)),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
              onPressed: (() {
                print(_scrollController.positions.first.pixels);
                _scrollController.animateTo(
                    _scrollController.positions.first.minScrollExtent,
                    duration: const Duration(seconds: 1),
                    curve: Curves.linear);
              }),
              child: const Icon(Icons.start)),
          FloatingActionButton(
              onPressed: (() {
                print(_scrollController.positions.last.pixels);
                _scrollController.animateTo(
                    _scrollController.positions.last.maxScrollExtent,
                    duration: const Duration(seconds: 1),
                    curve: Curves.linear);
              }),
              child: const Icon(Icons.last_page)),
          FloatingActionButton(
              onPressed: (() {
                print(_scrollController.positions.last.pixels);
                _scrollController.animateTo(listItemExten * 5,
                    duration: const Duration(seconds: 1), curve: Curves.linear);
              }),
              backgroundColor: floatingColor,
              child: const Icon(Icons.mic_rounded)),
        ],
      ),
    );
  }
}
// List View
ListView.custom(childrenDelegate: SliverChildListDelegate(List.generate(
              100,
              (index) => ListTile(
                    leading: CircleAvatar(
                      child: Text(index.toString()),
                    ),
                    title: Text('Index : $index'),
                    subtitle: const Text('Sub Title'),
                    trailing: const FlutterLogo(),

                  )),
        )),
ListView.separated(itemBuilder: (context, index) => ListTile(
          title: Text('Index : $index')), separatorBuilder:(context, index) => const Divider(), itemCount: list.length)
ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) => ListTile(
          title: Text('Index : $index'),
        ),
      ),

Center(
        child: ListView(
          children: List.generate(
              100,
              (index) => ListTile(
                    leading: CircleAvatar(
                      child: Text(index.toString()),
                    ),
                    title: Text('Index : $index'),
                    subtitle: const Text('Sub Title'),
                    trailing: const FlutterLogo(),

                  )),
        ),
      )

