import 'package:flutter/material.dart';
import 'package:flutter_navigation_habibi/app_navigation.dart';
import 'package:flutter_navigation_habibi/second_page.dart';
import 'package:flutter_navigation_habibi/third_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: MyHomePage.pageName,
      // routes: {
      //   MyHomePage.pageName: (context) => const MyHomePage(title: 'Pakistan'),
      //   SecondPage.pageName: (context) => const SecondPage()
      // },
      onGenerateRoute: onGenerateRoutes,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;
  static const pageName = '/';

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
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
              const Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          ),
        ),
        floatingActionButton: Row(mainAxisAlignment: MainAxisAlignment.end,children: [
          FloatingActionButton(
            heroTag: 'Second',
            onPressed: () {
              Navigator.pushNamed(context, SecondPage.pageName, arguments: 'Habihi Group');
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            heroTag: 'Third',
            onPressed: () {
              Navigator.pushNamed(context, ThirdPage.pageName, arguments: 'Habihi Group , Becoming Nikkama');
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            heroTag: 'Habibi',
            onPressed: () {
              Navigator.pushNamed(context, 'Habibi');
            },
            tooltip: 'Error',
            child: const Icon(Icons.error),
          ),
        ],)
    );
  }
}
Navigator.of(context).push(CupertinoPageRoute(builder: (context) => SecondPage(),));
Navigator.of(context).push(MaterialPageRoute(builder: (context) => SecondPage(),));
var tween =
    Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero);
Navigator.of(context).push(PageRouteBuilder(
  transitionDuration: const Duration(seconds: 1),
  pageBuilder: (context, animation, secondaryAnimation) =>
      const SecondPage(),
  transitionsBuilder:
      (context, animation, secondaryAnimation, child) =>
          SlideTransition(
    position: tween.animate(animation),
    child: RotationTransition(
      turns: animation,
      child: child,
    ),
  ),
));