// ignore_for_file: non_constant_identifier_names, avoid_types_as_parameter_names

import 'package:flutter/material.dart';
import 'package:flutterprovider/services/share_preference.dart';

class ThemeChangerProvider with ChangeNotifier {
  AppPrefs appPrefs = AppPrefs();

  final bool _darkTheme = false;
  bool get getDarkTheme => _darkTheme;

  var _themeMode = ThemeMode.light;
  ThemeMode get themeMode => _themeMode;

  void setTheme(ThemeMode) async {
    _themeMode = ThemeMode;
    notifyListeners();
  }
}
