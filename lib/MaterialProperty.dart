import 'package:flutter/material.dart';

import 'CheckBox.dart';

void main() {
  runApp(const MyApp());
}



//////////////////////////// Note ////////////////////

/////////// This class is show off for custom check box color, pressed, hovers etc function changes apply.


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isMale = false;
  String radioGroupValue = 'Male';
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
            Radio(
              value: 'Male',
              groupValue: radioGroupValue,
              onChanged: (value) {
                setState(() {
                  radioGroupValue = 'Male';
                });
              },
            ),
            Radio(
              value: 'Female',
              groupValue: radioGroupValue,
              onChanged: (value) {
                setState(() {
                  radioGroupValue = 'Female';
                });
              },
            ),
            SizedBox(
              width: 100,
              child: ListTile(
                leading: const Text('Male'),
                title: MyCheckBox(
                  value: isMale,
                  onChanged: (value) => setState(() {
                    isMale = value!;
                  }),
                ),
              ),
            ),
            SizedBox(
              width: 100,
              child: ListTile(
                leading: const Text('Female'),
                title: MyCheckBox(
                  value: !isMale,
                  onChanged: (value) {
                    setState(() {
                      isMale = !value!;
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

