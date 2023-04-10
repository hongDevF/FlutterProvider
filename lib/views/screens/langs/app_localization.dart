// import 'dart:async';
// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// class AppLocalizations {
//   final Locale locale;
  
//   AppLocalizations(Locale locale, Locale locale) : locale = locale;

//   // AppLocalizations(this.locale);

//   static AppLocalizations of(BuildContext context) {
//     final localizations =
//         Localizations.of<AppLocalizations>(context, AppLocalizations);
//     if (localizations == null) {
//       throw FlutterError(
//           'AppLocalizations.of() called with a context that does not contain an AppLocalizations widget.');
//     }
//     return localizations;
//   }

//   static const LocalizationsDelegate<AppLocalizations> delegate =
//       _AppLocalizationsDelegate();

//   late Map<String, String> _localizedStrings;

//   Future<bool> load() async {
//     final jsonString =
//         await rootBundle.loadString('assets/lang/${locale.languageCode}.json');
//     final jsonMap = json.decode(jsonString) as Map<String, dynamic>;
//     _localizedStrings =
//         jsonMap.map((key, value) => MapEntry(key, value.toString()));
//     return true;
//   }

//   String translate(String key) {
//     return _localizedStrings[key] ?? key;
//   }
// }

// class _AppLocalizationsDelegate
//     extends LocalizationsDelegate<AppLocalizations> {
//   const _AppLocalizationsDelegate();

//   @override
//   bool isSupported(Locale locale) => ['en', 'km'].contains(locale.languageCode);

//   @override
//   Future<AppLocalizations> load(Locale locale) async {
//     final appLocalizations = AppLocalizations(locale);
//     await appLocalizations.load();
//     return appLocalizations;
//   }

//   @override
//   bool shouldReload(_AppLocalizationsDelegate old) => false;
// }
