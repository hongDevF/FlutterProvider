import 'package:flutter/material.dart';

class LanguageModel extends ChangeNotifier {
  Locale _locale = const Locale('en', ''); // Default locale is English

  Locale get locale => _locale;

  void setLocale(Locale newLocale) {
    _locale = newLocale;
    notifyListeners();
  }
}
