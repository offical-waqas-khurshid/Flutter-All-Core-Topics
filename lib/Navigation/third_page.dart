import 'package:flutter/material.dart';

class ThirdPage extends StatelessWidget {
  ThirdPage({super.key});
  static const pageName = '/ThirdPage';
  String name = '';
  @override
  Widget build(BuildContext context) {
    name = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(title: const Text('Third Page')),
      body: Container(
          color: Colors.blueGrey,
          child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('Third Page : Inputed Name = $name'),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Exit'))
                ]),
          )),
    );
  }
}
