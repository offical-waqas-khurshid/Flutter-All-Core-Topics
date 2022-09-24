
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
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
  final TextEditingController _textEditingController = TextEditingController();
  String textInputData = 'Click To Show';
  String mirrorText = 'Mirror';

  FocusNode focusNode1 = FocusNode();
  FocusNode focusNode2 = FocusNode();
  FocusNode focusNode3 = FocusNode();
  FocusNode focusNode4 = FocusNode();
  FocusNode focusNode5 = FocusNode();

  @override
  void initState() {
    super.initState();
    // _textEditingController.addListener(() {
    //   setState(() {
    //     mirrorText = _textEditingController.text;
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: SizedBox(
          width: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(mirrorText),
              Text(textInputData),
              TextField(
                focusNode: focusNode1,
              ),
              TextField(
                focusNode: focusNode2,
              ),
              TextField(
                focusNode: focusNode3,
                controller: _textEditingController,
                onChanged: (value) {
                  setState(() {
                    mirrorText = value;
                  });
                },
                onSubmitted: (value) {
                  setState(() {
                    textInputData = value;
                  });
                },
              ),
              TextField(
                focusNode: focusNode4,
              ),
              ElevatedButton(
                  focusNode: focusNode5,
                  onPressed: () {
                    setState(() {
                      textInputData = _textEditingController.text;
                    });
                  },
                  child: const Text('Click')),
              ElevatedButton(
                  onPressed: () {
                    _textEditingController.clear();
                  },
                  child: const Text('Clear')),
              ElevatedButton(
                  onPressed: () {
                    focusNode2.requestFocus();
                  },
                  child: const Text('Change Focus')),
              ElevatedButton(
                  onPressed: () {
                    focusNode3.skipTraversal = true;
                    focusNode4.skipTraversal = true;
                  },
                  child: const Text('Disable Focus')),
              ElevatedButton(
                  onPressed: () {
                    focusNode3.skipTraversal = false;
                    focusNode4.skipTraversal = false;
                  },
                  child: const Text('Enable')),
            ],
          ),
        ),
      ),
    );
  }
}

