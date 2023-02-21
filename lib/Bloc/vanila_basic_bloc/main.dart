import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc_habibi/counter.dart';
import 'package:flutter_bloc_habibi/counter_bloc.dart';
import 'package:flutter_bloc_habibi/counter_event.dart';

import 'CounterBloc.dart';
import 'Events.dart';

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
      home:  MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key, required this.title});

  final String title;

  final CounterBloc counterBloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: StreamBuilder<Counter>(
          stream: counterBloc.stateStream,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.none) {
              return const Center(
                child: Text("Press Floating Button to Start"),
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Center(child: Text(snapshot.data!.count.toString()),);
            }
          },
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {
                counterBloc.eventSink.add(IncrementCounterEvent());
              },
              child: const Icon(Icons.add),
            ),
            FloatingActionButton(
              onPressed: () {
                counterBloc.eventSink.add(DecrementCounterEvent());
              },
              child: const Icon(Icons.remove),
            )
          ],
        ));
  }
}