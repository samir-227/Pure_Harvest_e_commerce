import 'package:flutter/material.dart';
import 'package:fruits_hub/core/constants/constants.dart';
import 'package:fruits_hub/core/helpers/cache_helper.dart';
import 'package:fruits_hub/core/theming/theme_data.dart';

class ThemeProvider extends ChangeNotifier {
// Key for storing theme preference in SharedPreferences

// Track the current theme state
  bool isDarkMode = false;
  ThemeData get() => isDarkMode ? AppThemes.darkTheme : AppThemes.lightTheme;

// Get the current ThemeData based on the theme state
  Future<void> loadCurrentMode() async {
    isDarkMode = CacheHelper.getBool(key: kIsDarkMode) ?? false;
    notifyListeners();
  }

  /// Save the theme preference to SharedPreferences
  Future<void> saveTheme() async {
    CacheHelper.set(key: kIsDarkMode, value: isDarkMode);
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
