import 'package:flutter/material.dart';
import 'package:flutter_hero_habibi/product.dart';
import 'package:flutter_hero_habibi/product_detail.dart';

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
  static const transitionDuration = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) => ListTile(
              leading: Hero(
                  tag: products[index].title,
                  placeholderBuilder: (context, heroSize, child) => Opacity(
                    opacity: 0.3,
                    child: child,
                  ),
                  flightShuttleBuilder: (flightContext, animation,
                      flightDirection, fromHeroContext, toHeroContext) {
                    final Hero toHero = toHeroContext.widget as Hero;
                    return ScaleTransition(
                      scale: CurvedAnimation(
                          parent: animation, curve: Curves.bounceInOut),
                      child: toHero.child,
                    );
                  },
                  child: CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage(products[index].imagePath))),
              title: Text(products[index].title),
              subtitle: Text(products[index].price.toString()),
              onTap: () => Navigator.of(context).push(PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    ProductDetailPage(product: products[index]),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  var tween = Tween<Offset>(
                      begin: const Offset(1, 0), end: Offset.zero);
                  return SlideTransition(
                    position: tween.animate(animation),
                    child: child,
                  );
                },
                transitionDuration: const Duration(seconds: transitionDuration),
                reverseTransitionDuration:
                const Duration(seconds: transitionDuration),
              )),
            ),
          ),
        ));
  }
}
