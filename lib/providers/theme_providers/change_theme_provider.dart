import 'package:flutter/material.dart';

class ChangeTheme with ChangeNotifier {
  ThemeData _themeData;

  ChangeTheme(this._themeData);

  getTheme() => _themeData;

  setTheme(ThemeData themeData) async {
    _themeData = themeData;
    notifyListeners();
  }
}

