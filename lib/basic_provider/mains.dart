import 'package:flutter/material.dart';
import 'package:flutter_gsm_provider_habibi/counter.dart';
import 'package:flutter_gsm_provider_habibi/student.dart';
import 'package:provider/provider.dart';

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
      home: ChangeNotifierProvider<Student>(
          create: (context) => Student(rollNo: 12,name: 'Habibi',fee: 500),
          child: const MyHomePage(title: 'Flutter Demo Home Page')),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    //var counter = Provider.of<Counter>(context,listen: false);
    var student = context.read<Student>();
    //var counter = Provider.of<Counter>(context);
    //var counter = context.watch<Counter>();
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Selector<Student,int>(
                selector: (context, student) => student.rollNo!,
                builder: (context, value, child) => Text(
                  '${student.rollNo}',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
              Selector<Student,String>(
                selector: (context, student) =>student.name! ,
                builder: (context, value, child) => Text(value),
              ),
              Selector<Student,double>(
                selector: (context, student) =>student.fee! ,
                builder: (context, value, child) => Text(value.toString()),
              )
            ],
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {
                student.rollNo = 34;
              },
              tooltip: 'RollNo',
              child: const Icon(Icons.add),
            ),
            FloatingActionButton(
              onPressed: () {
                student.name = 'Usman';
              },
              tooltip: 'Name',
              child: const Icon(Icons.remove),
            ),
            FloatingActionButton(
              onPressed: () {
                student.fee = 56000;
              },
              tooltip: 'Fee',
              child: const Icon(Icons.food_bank),
            ),
          ],
        ));
  }
}