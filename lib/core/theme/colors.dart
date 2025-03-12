import 'package:flutter/material.dart';

// Light Theme Colors
class LightThemeColors {
  static const Color primary = Color(0xFF1B5E37); // Green1/500 for buttons
  static const Color secondary =
      Color(0xFF2D9F5D); // green/500 for icons, secondary actions
  static const Color surface = Color(0xFFF9FAFA); // scaffold background
  static const Color textPrimary =
      Color(0xFF0C0D0D); // Grayscale/950 for main text
  static const Color textSecondary =
      Color(0xFF949D9E); // Grayscale/500 for hints
  static const Color secondaryContainer =
      Color(0xFFF4A91F); // Orange/500 for banners
  static const Color error = Color(0xFFEB5757); // Error states
  static const Color onPrimary = Color(0xffFFFFFF); // Text on primary
  static const Color onSecondary =
      Color(0xff4E5556); // Text on secondary like icons or buttons
  static const Color onError = Colors.white; // Text on error
  static const Color onSurface = Color(0xFFFFFFFF); // Main text
  static const Color onBackground = Color(0xFFFFFFFF); // Text on background

  static const Color outline = Color(0xFFE6E9E9); // Borders
}

// Dark Theme Colors
class DarkThemeColors {
  static const Color primary =
      Color(0xFF217242); // Slightly lighter green for contrast
  static const Color secondary =
      Color(0xFF2D9F5D); // Same green for consistency
  static const Color background = Color(0xFF121212); // Dark background
  static const Color surface = Color(0xFF0D0D0D); // Dark gray for cards
  static const Color textPrimary = Color(0xFFFFFFFF); // White text
  static const Color textSecondary = Color(0xFF949D9E); // Light gray text
  static const Color secondaryContainer =
      Color(0xFFF4A91F); // Same orange for banners
  static const Color error = Color(0xFFEF5350); // Error states
  static const Color onPrimary = Colors.black; // Text on primary
  static const Color onSecondary = Colors.white; // Text on secondary
  static const Color onError = Colors.white; // Text on error
  static const Color onSurface = Color(0xFFFFFFFF); // Main text
  static const Color onBackground = Color(0xFFFFFFFF); // Text on background

  static const Color outline = Color(0xFFB0B0B0); // Borders
}
