import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
  final FocusNode _focusNode = FocusNode();
  Color _bgColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bgColor,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: RawKeyboardListener(
        focusNode: _focusNode,
        autofocus: true,
        onKey: (event) {
          if (event.isControlPressed &&
              event.logicalKey == LogicalKeyboardKey.keyB) {
            setState(() {
              _bgColor = Colors.blue;
            });
          } else if (event.isControlPressed &&
              event.logicalKey == LogicalKeyboardKey.keyP) {
            setState(() {
              _bgColor = Colors.pink;
            });
          } else if (event.isControlPressed &&
              event.logicalKey == LogicalKeyboardKey.keyR) {
            setState(() {
              _bgColor = Colors.red;
            });
          } else if (event.isControlPressed &&
              event.logicalKey == LogicalKeyboardKey.keyG) {
            setState(() {
              _bgColor = Colors.green;
            });
          } else if (event.isControlPressed &&
              event.logicalKey == LogicalKeyboardKey.keyY) {
            setState(() {
              _bgColor = Colors.yellow;
            });
          } else if (event.isControlPressed &&
              event.logicalKey == LogicalKeyboardKey.keyA) {
            setState(() {
              _bgColor = Colors.amber;
            });
          }
        },
        child: Center(
          child: SizedBox(
            width: 200,
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Focus(
                    onKey: (focusNode, value) {
                      if (value.logicalKey.keyId >=
                          LogicalKeyboardKey.digit0.keyId &&
                          value.logicalKey.keyId <=
                              LogicalKeyboardKey.digit9.keyId) {
                        return KeyEventResult.ignored;
                      } else {
                        return KeyEventResult.handled;
                      }
                    },
                    child: TextFormField(
                      decoration: const InputDecoration(
                          hintText: 'Enter the cell no',
                          labelText: 'Cell Phone'),
                      validator: MyValidator(),
                    ),
                  ),
                  TextFormField()
                ],
              ),
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

