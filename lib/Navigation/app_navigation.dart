import 'package:flutter/widgets.dart';
import 'package:flutter_navigation_habibi/main.dart';
import 'package:flutter_navigation_habibi/second_page.dart';

import 'error_page.dart';
import 'third_page.dart';

Route<dynamic> onGenerateRoutes(RouteSettings settings) {
  if (settings.name == MyHomePage.pageName) {
    var tween = Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero);
    return PageRouteBuilder(
      settings: settings,
      transitionDuration: const Duration(seconds: 1),
      pageBuilder: (context, animation, secondaryAnimation) =>
      const MyHomePage(title: 'Pakistan'),
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          SlideTransition(
            position: tween.animate(animation),
            child: RotationTransition(
              turns: animation,
              child: child,
            ),
          ),
    );
  } else if (settings.name == SecondPage.pageName) {
    var tween = Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero);
    return PageRouteBuilder(
      settings: settings,
      transitionDuration: const Duration(seconds: 1),
      pageBuilder: (context, animation, secondaryAnimation) =>
          SecondPage(name: settings.arguments as String),
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          SlideTransition(
            position: tween.animate(animation),
            child: RotationTransition(
              turns: animation,
              child: child,
            ),
          ),
    );
  } else if (settings.name == ThirdPage.pageName) {
    var tween = Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero);
    return PageRouteBuilder(
      settings: settings,
      transitionDuration: const Duration(seconds: 1),
      pageBuilder: (context, animation, secondaryAnimation) => ThirdPage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          SlideTransition(
            position: tween.animate(animation),
            child: RotationTransition(
              turns: animation,
              child: child,
            ),
          ),
    );
  } else {
    var tween = Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero);
    return PageRouteBuilder(
      settings: settings,
      transitionDuration: const Duration(seconds: 1),
      pageBuilder: (context, animation, secondaryAnimation) =>
      const ErrorPage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          SlideTransition(
            position: tween.animate(animation),
            child: RotationTransition(
              turns: animation,
              child: child,
            ),
          ),
    );
  }
}
