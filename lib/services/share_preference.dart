// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'package:shared_preferences/shared_preferences.dart';

class AppPrefs {
  // theme preference
  static const THEME_STATUS = "STATUS";
  setDarkTheme(bool value) async {
    SharedPreferences Prefs = await SharedPreferences.getInstance();
    Prefs.setBool(THEME_STATUS, value);
  }

  Future<bool> getTheme() async {
    SharedPreferences Prefs = await SharedPreferences.getInstance();
    return Prefs.getBool(THEME_STATUS) ?? false;
  }
  //
}
