import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  int _counter = 0;
  String _dummyState = 'dummyState';

  int get counter => _counter;
  String get dummyState => _dummyState;

  void incrementCounter() {
    _counter++;
    notifyListeners();
  }

  void decrementCounter() {
    _counter--;
    notifyListeners();
  }

  void updateDummyState(String newDummyState) {
    if (_dummyState == newDummyState) return;

    _dummyState = newDummyState;
    notifyListeners();
  }
}
