import 'package:flutter/material.dart';
import 'package:flutter_hero_advance_habibi/second_page.dart';

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

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _widthAnimation;
  late Animation<double> _radiusAnimation;

  String btnText = 'Go To Second Page';

  @override
  void initState() {
    super.initState();
    _animationController =
    AnimationController(vsync: this, duration: const Duration(seconds: 2))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) async {
        if (status == AnimationStatus.completed) {
          await Navigator.of(context).push(PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
              const SecondPage(),
              reverseTransitionDuration: const Duration(seconds: 3),
              transitionDuration: const Duration(seconds: 3)));

          btnText = 'Go To Second Page';
          _animationController.reset();
        }
      });
    _widthAnimation =
        Tween<double>(begin: 400, end: 40).animate(_animationController);
    _radiusAnimation =
        Tween<double>(begin: 20, end: 40).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            const Text('Main Page'),
            InkWell(
              onTap: () {
                btnText = '';
                _animationController.forward();
              },
              child: Hero(
                tag: 'Second',
                flightShuttleBuilder: (flightContext, animation,
                    flightDirection, fromHeroContext, toHeroContext) {
                  return Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        color: Colors.black, shape: BoxShape.circle),
                  );
                },
                child: Container(
                  width: _widthAnimation.value,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius:
                      BorderRadius.circular(_radiusAnimation.value)),
                  child: Center(
                    child: Text(
                      btnText,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
