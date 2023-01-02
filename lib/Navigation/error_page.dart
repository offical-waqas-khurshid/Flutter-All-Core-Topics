import 'package:flutter/material.dart';
import 'package:flutter_navigation_habibi/main.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Error Page')),
      body: Center(
        child: Container(
          color: Colors.red,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('404 ! Not Found', style: Theme.of(context).textTheme.headline1,),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(MyHomePage.pageName);
                  },
                  child: const Icon(Icons.home))
            ],
          ),
        ),
      ),
    );
  }
}
