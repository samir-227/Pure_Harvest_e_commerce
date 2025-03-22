import 'package:flutter/material.dart';
import 'package:fruits_hub/core/theming/theme_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
// Key for storing theme preference in SharedPreferences
  static const String _themeKey = "isDarkMode";

// Track the current theme state
// _isDarkMode my Theme State
  bool isDarkMode = false;
  ThemeData get() => isDarkMode ? AppThemes.darkTheme : AppThemes.lightTheme;

// Get the current ThemeData based on the theme state
  Future<void> loadCurrentMode() async {
    final pref = await SharedPreferences.getInstance();
    isDarkMode = pref.getBool(_themeKey) ?? false;
    notifyListeners();
  }

  /// Save the theme preference to SharedPreferences
  Future<void> saveTheme() async {
    final pref = await SharedPreferences.getInstance();
    pref.setBool(_themeKey, isDarkMode);
    notifyListeners();
  }

// Set a specific theme
  void setMode(ThemeData theme) {
    isDarkMode = theme == AppThemes.darkTheme;
    saveTheme();
    notifyListeners();
  }

// Toggle between light and dark themes
  void toggleTheme() {
    isDarkMode = !isDarkMode;
    saveTheme();
    notifyListeners();
  }
}
