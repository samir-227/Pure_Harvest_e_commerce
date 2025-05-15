import 'package:flutter/material.dart';

class LocaleProvider extends ChangeNotifier {
  Locale _locale = const Locale('ar', 'eg');

  Locale get locale => _locale;

  void setLocale(Locale locale) {
    if (locale.languageCode == 'ar') {
      _locale = const Locale('ar', 'EG');
    } else {
      _locale = const Locale('en', 'US');
    }
    _locale = locale;
    notifyListeners();
  }
}
