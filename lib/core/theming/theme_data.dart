import 'package:flutter/material.dart';
import 'package:fruits_hub/core/theming/fonts.dart';

import 'colors.dart';

class AppThemes {
  static final ThemeData lightTheme = ThemeData(
    fontFamily: AppFonts.kCairoFont,
    useMaterial3: true,
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      // Primary colors
      primary: LightThemeColors.primary,
      onPrimary: LightThemeColors.onPrimary,
      primaryContainer: LightThemeColors.primary,

      // Secondary colors
      secondary: LightThemeColors.secondary,
      onSecondary: LightThemeColors.textPrimary,
      secondaryContainer: LightThemeColors.secondaryContainer,

      // Surface colors
      surface: Color(0xFFFFFFFF), // Main background (Scaffold)
      onSurface: Color(0xFF0C0D0D), // Main text
      surfaceContainerHighest: Color(0xFFF3F5F7), // Cards/inputs
      onSurfaceVariant: Color(0xFF949D9E), // Secondary text

      // Error colors
      error: LightThemeColors.error,
      onError: Colors.white,

      // Outline colors
      outline: LightThemeColors.outline,
      outlineVariant: LightThemeColors.outline,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      foregroundColor: LightThemeColors.textPrimary,
      scrolledUnderElevation: 2,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: LightThemeColors.primary,
        foregroundColor: LightThemeColors.onPrimary,
      ),
    ),
    cardTheme: const CardTheme(
      color: LightThemeColors.surface,
      elevation: 1,
      surfaceTintColor: Colors.transparent,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      fillColor: LightThemeColors.surface,
      border: OutlineInputBorder(),
      labelStyle: TextStyle(color: LightThemeColors.textSecondary),
    ),
    dividerTheme: const DividerThemeData(
      color: LightThemeColors.textSecondary,
      thickness: 1,
    ),
  );
  /* fontFamily: AppFonts.kCairoFont,
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: LightThemeColors.primary,
      scaffoldBackgroundColor: LightThemeColors.background,
      colorScheme: const ColorScheme.light(
        primary: LightThemeColors.primary,
        secondary: LightThemeColors.secondary,
        surface: LightThemeColors.surface,
        onPrimary: Colors.white,
        onSecondary: Colors.black,
        onSurface: LightThemeColors.textPrimary,
        error: LightThemeColors.error,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: LightThemeColors.primary,
          foregroundColor: Colors.white,
        ),
      ),
      cardTheme: const CardTheme(
        color: LightThemeColors.surface,
        elevation: 2,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        fillColor: LightThemeColors.surface,
        filled: true,
        border: OutlineInputBorder(),
        labelStyle: TextStyle(color: LightThemeColors.textSecondary),
      ),);
*/

  static final ThemeData darkTheme = ThemeData(
    fontFamily: AppFonts.kCairoFont,
    useMaterial3: true,
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      // Primary colors
      primary: DarkThemeColors.primary,
      onPrimary: DarkThemeColors.textPrimary,
      primaryContainer: DarkThemeColors.primary,

      // Secondary colors
      secondary: DarkThemeColors.secondary,
      onSecondary: DarkThemeColors.textPrimary,
      secondaryContainer: DarkThemeColors.secondaryContainer,

      // Surface colors
      surface: DarkThemeColors.surface, // Main background (Scaffold)
      onSurface: DarkThemeColors.textPrimary, // Main text
      surfaceContainerHighest: DarkThemeColors.surface, // Cards/inputs
      onSurfaceVariant: DarkThemeColors.textSecondary, // Secondary text

      // Error colors
      error: DarkThemeColors.error,
      onError: Colors.white,

      // Outline colors
      outline: DarkThemeColors.outline,
      outlineVariant: DarkThemeColors.outline,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: DarkThemeColors.surface,
      foregroundColor: DarkThemeColors.textPrimary,
      scrolledUnderElevation: 2,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: DarkThemeColors.primary,
        foregroundColor: DarkThemeColors.textPrimary,
      ),
    ),
    cardTheme: const CardTheme(
      color: DarkThemeColors.surface,
      elevation: 1,
      surfaceTintColor: Colors.transparent,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      fillColor: DarkThemeColors.surface,
      border: OutlineInputBorder(),
      labelStyle: TextStyle(color: DarkThemeColors.textSecondary),
    ),
    dividerTheme: const DividerThemeData(
      color: DarkThemeColors.textSecondary,
      thickness: 1,
    ),
  );
}
