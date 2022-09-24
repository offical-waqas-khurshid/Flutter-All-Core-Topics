import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

extension DigitConversition on String {
  bool isDigitString() {
    for (var i = 0; i < length; i++) {
      if (!(codeUnitAt(i) >= '0'.codeUnitAt(0) &&
          codeUnitAt(i) <= '9'.codeUnitAt(0))) {
        return false;
      }
    }
    return true;
  }
}

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
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: SizedBox(
          width: 200,
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  decoration: const InputDecoration(
                      hintText: 'Enter the cell no', labelText: 'Cell Phone'),
                  validator: (value) {
                    if (value!.length == 11 && value.isDigitString()) {
                      return null;
                    } else {
                      return 'Cell Phone Length Must be 11 digits';
                    }
                  },
                ),
                TextFormField()
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          formKey.currentState!.validate();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

