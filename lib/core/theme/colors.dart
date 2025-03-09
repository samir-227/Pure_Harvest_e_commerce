import 'package:flutter/material.dart';

// Light Theme Colors
class LightThemeColors {
  static const Color primary = Color(0xFF003E29); // Green1/500 for buttons
  static const Color secondary =
      Color(0xFF2D9F5D); // green/500 for icons, secondary actions
  static const Color background = Color(0xFFFFFFFF); // White background
  static const Color surface = Color(0xFFE6E9EA); // Cards and input fields
  static const Color textPrimary =
      Color(0xFF0C0D0D); // Grayscale/950 for main text
  static const Color textSecondary =
      Color(0xFF949D9E); // Grayscale/500 for hints
  static const Color secondaryContainer = Color(0xFFF4A91F); // Orange/500 for banners
  static const Color error = Color(0xFFEB5757); // Error states
}

// Dark Theme Colors
class DarkThemeColors {
  static const Color primary =
      Color(0xFF2E7D32); // Slightly lighter green for contrast
  static const Color secondary = Color(0xFF5DB957); // Same green for consistency
  static const Color background = Color(0xFF121212); // Dark background
  static const Color surface = Color(0xFF1E1E1E); // Dark gray for cards
  static const Color textPrimary = Color(0xFFFFFFFF); // White text
  static const Color textSecondary = Color(0xFFB0B0B0); // Light gray text
  static const Color secondaryContainer = Color(0xFFF4A91F);  // Same orange for banners
  static const Color error =
      Color(0xFFEF5350); // Slightly brighter red for dark mode
}
