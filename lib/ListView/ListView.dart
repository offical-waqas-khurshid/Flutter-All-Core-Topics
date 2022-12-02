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
  var list = List.generate(100, (index) => 'Index :$index');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.custom(
          childrenDelegate: SliverChildBuilderDelegate(
                  (context, index) => ListTile(title: Text('Index : $index')),
              childCount: list.length)),
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

