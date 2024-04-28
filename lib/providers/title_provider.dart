import 'package:flutter/material.dart';

class TitleProvider extends ChangeNotifier {
  TitleProvider({required String title}) : _title = title;

  late String _title;

  String get title => _title;

  set title(String newTitle) {
    if (_title == newTitle) return;

    _title = newTitle;
    notifyListeners();
  }
}
