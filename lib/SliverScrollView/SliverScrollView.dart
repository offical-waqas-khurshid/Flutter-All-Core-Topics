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
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Sliver Demo'),
      // ),
      body: CustomScrollView(slivers: [
        SliverAppBar(
          //  title: const Text('Slivers Demo'),
            floating: true,
            snap: false,
            pinned: true,
            expandedHeight: 200,
            centerTitle: false,
            flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: const Text('Sliver Demo App Bar'),
                background: Image.asset('assets/images/bigburger.png')),
            actions: [
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.access_alarm)),
            ]),
        const SliverToBoxAdapter(child: Text('Sliver To Box Adaptor')),
        SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: 50,
                  (context, index) => ListTile(
                title: Text('index = $index'),
                tileColor: Colors.cyan,
              ),
            )),
        SliverGrid.count(
          crossAxisCount: 4,
          children: List.generate(
              100,
                  (index) => Container(
                child: Text('index:$index'),
              )),
        )
      ]),
    );
  }
}

