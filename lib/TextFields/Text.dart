import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      debugShowCheckedModeBanner: false,
      title: 'Cupertino date picke',
      theme: CupertinoThemeData(
        brightness: Brightness.light,
      ),
      home: CuperTiono(),
    );
  }
}

class CuperTiono extends StatefulWidget {
  const CuperTiono({super.key});
  @override
  State<StatefulWidget> createState() {
    return _CuperTinoState();
  }
}

class _CuperTinoState extends State<CuperTiono> {
  DateTime _dateTime = DateTime.now();
  void _selectDateTime() {
    showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Theme(
              data: ThemeData.light(),
              child: Container(
                height: 400,
                width: 500,
                color: Colors.white70,
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.date,
                  initialDateTime: _dateTime,
                  onDateTimeChanged: (date) => setState(
                        () {
                      _dateTime = date;
                    },
                  ),
                ),
              ),
            ),
            CupertinoButton(
              onPressed: (() => Navigator.pop(context)),
              child: const Text('Done'),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Colors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: _selectDateTime,
              child: const Text(
                'Pick  Date',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
              ),
            ),
            Text(
              '${_dateTime.day}:${_dateTime.month}:${_dateTime.year}',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
            )
          ],
        ),
      ),
    );
  }
}

