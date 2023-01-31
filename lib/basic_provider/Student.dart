import 'package:flutter/foundation.dart';

class Counter extends ChangeNotifier {
  int count = 0;
  void increment() {
    count++;
    notifyListeners();
  }

  void decrement() {
    count--;
    notifyListeners();
  }
}
