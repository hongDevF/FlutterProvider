import 'package:flutter/material.dart';

class ThemeSetting extends ChangeNotifier {
  ThemeData _currenTheme = ThemeData.light();

  ThemeData get currenTheme => _currenTheme;

  void toggleTheme() {
    if (_currenTheme == ThemeData.light()) {
      _currenTheme = ThemeData.dark();
    } else {
      _currenTheme = ThemeData.light();
    }

    notifyListeners();
  }
}
