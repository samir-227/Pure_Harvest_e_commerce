import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fruits_hub/core/constants/constants.dart';
import 'package:fruits_hub/core/helpers/cache_helper.dart';
import 'package:fruits_hub/core/theming/theme_data.dart';

class SettingsProvider extends ChangeNotifier {
  // Keys for SharedPreferences
  // State
  bool isDarkMode = false;
  Locale _locale = const Locale('ar');

// Track the current theme state
  ThemeData get() => isDarkMode ? AppThemes.darkTheme : AppThemes.lightTheme;
  Locale get locale => _locale;

  // Initialize settings from SharedPreferences
  Future<void> loadSettings() async {
    isDarkMode = CacheHelper.getBool(key: kIsDarkMode) ?? false;

    String? langCode = CacheHelper.getString(key: kLanguageCode);
    _locale = Locale(langCode);
    notifyListeners();
  }

  // Toggle Theme
  Future<void> toggleTheme() async {
    isDarkMode = !isDarkMode;
    saveTheme();
    log(isDarkMode.toString());
    notifyListeners();
  }

  // Set Specific Theme
  Future<void> setTheme(bool darkMode) async {
    isDarkMode = darkMode;
    saveTheme();
    notifyListeners();
  }

  // Change Locale
  Future<void> setLocale(Locale newLocale) async {
    _locale = newLocale;
    await CacheHelper.set(key: kLanguageCode, value: _locale.languageCode);
    notifyListeners();
  }

  /// Save the theme preference to SharedPreferences
  Future<void> saveTheme() async {
    CacheHelper.set(key: kIsDarkMode, value: isDarkMode);
    notifyListeners();
  }
}
