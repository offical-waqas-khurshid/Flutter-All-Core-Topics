import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({required this.name,super.key});
  static const pageName = '/SecondPage';
  final String name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Second Page')),
      body: Container(
          color: Colors.blueGrey,
          child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('Second Page : Inputed Name = $name'),
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
