import 'package:flutter/material.dart';
import 'package:fruits_hub/core/theme/fonts.dart';

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
  //   fontFamily: AppFonts.kCairoFont,
  //   useMaterial3: true,
  //   brightness: Brightness.dark,
  //   primaryColor: DarkThemeColors.primary,
  //   scaffoldBackgroundColor: DarkThemeColors.background,
  //   colorScheme: const ColorScheme.dark(
  //     primary: DarkThemeColors.primary,
  //     secondary: DarkThemeColors.secondary,
  //     surface: DarkThemeColors.surface,
  //     onPrimary: Colors.black,
  //     onSecondary: Colors.white,
  //     onSurface: DarkThemeColors.textPrimary,
  //     error: DarkThemeColors.error,
  //   ),
  //   appBarTheme: const AppBarTheme(
  //     backgroundColor: Colors.black,
  //     foregroundColor: Colors.white,
  //   ),
  //   elevatedButtonTheme: ElevatedButtonThemeData(
  //     style: ElevatedButton.styleFrom(
  //       backgroundColor: DarkThemeColors.primary,
  //       foregroundColor: Colors.white,
  //     ),
  //   ),
  //   cardTheme: const CardTheme(
  //     color: DarkThemeColors.surface,
  //     elevation: 2,
  //   ),
  //   inputDecorationTheme: const InputDecorationTheme(
  //     fillColor: DarkThemeColors.surface,
  //     filled: true,
  //     border: OutlineInputBorder(),
  //     labelStyle: TextStyle(color: DarkThemeColors.textSecondary),
  //   ),
  // );
}

// class ThemeService {
//   // This function returns the light theme for the application
//   static ThemeData light() => ThemeData(
//         // Set the default font family for the theme
//         fontFamily: AppFonts.kCairoFont,

//         // Set the primary color of the theme
//         primaryColor: AppColors.kPrimaryColor,

//         // Define the AppBar theme with a primary color background
//         appBarTheme: const AppBarTheme(
//           backgroundColor: AppColors.kPrimaryColor,
//         ),

//         // Set the secondary header color used in widgets
//         secondaryHeaderColor: AppColors.kSecondaryColor,

//         // Define the color for disabled elements
//         disabledColor: AppColors.kDisabledColor,

//         // Specify the overall brightness of the theme as light
//         brightness: Brightness.light,

//         // Set the hint color for input fields
//         hintColor: AppColors.kHintColor,

//         // Card color for card widgets
//         cardColor: AppColors.kCardColor,

//         // Shadow color for elevated elements, with slight opacity
//         shadowColor: Colors.black.withAlpha(8),

//         // Define the TextButton theme with a custom style
//         textButtonTheme: TextButtonThemeData(
//             style:
//                 TextButton.styleFrom(foregroundColor: AppColors.kPrimaryColor)),

//         // Configure the color scheme for the theme
//         colorScheme: const ColorScheme.light(
//                 primary: AppColors.kPrimaryColor,
//                 secondary: AppColors.kSecondaryColor)
//             .copyWith(
//               surface: const Color(0xFFFCFCFC), // Surface color for components
//             )
//             .copyWith(
//               error: const Color(0xFFE84D4F), // Error color for the theme
//             ),

//         // Popup menu theme with white background and surface tint
//         popupMenuTheme: const PopupMenuThemeData(
//             color: Colors.white, surfaceTintColor: Colors.white),

//         // Dialog theme with white surface tint
//         dialogTheme: const DialogTheme(surfaceTintColor: Colors.white),

//         // Floating action button theme with a rounded shape
//         floatingActionButtonTheme: FloatingActionButtonThemeData(
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(500),
//           ),
//         ),

//         // Bottom app bar theme with white surface tint and specific height
//         bottomAppBarTheme: const BottomAppBarTheme(
//           surfaceTintColor: Colors.white,
//           height: 60,
//           padding: EdgeInsets.symmetric(vertical: 5),
//         ),

//         // Divider theme with specified thickness and color
//         dividerTheme:
//             const DividerThemeData(thickness: 0.2, color: Color(0xFFA0A4A8)),

//         // Tab bar theme with transparent divider color
//         tabBarTheme: const TabBarTheme(dividerColor: Colors.transparent),
//       );

//   /// Create a dark theme.
//   /// This theme is used when the user sets their device to dark mode.
//   static ThemeData dark() => ThemeData(
//         // Set the font family to Cairo
//         fontFamily: AppFonts.kCairoFont,
//         // Set the primary color to the primary color of the app
//         primaryColor: AppColors.kPrimaryColor,
//         // Set the secondary header color to a light gray color
//         secondaryHeaderColor: const Color(0xFF4da2a9),
//         // Set the app bar theme to have a dark background color
//         appBarTheme: const AppBarTheme(
//           backgroundColor: AppColors.kPrimaryColor,
//         ),
//         // Set the disabled color to a light gray color
//         disabledColor: const Color(0xffa2a7ad),
//         // Set the brightness of the theme to dark
//         brightness: Brightness.dark,
//         // Set the hint color of input fields to a light gray color
//         hintColor: const Color(0xFFbebebe),
//         // Set the card color to a dark gray color
//         cardColor: const Color(0xFF30313C),
//         // Set the shadow color to a light gray color with a small amount of opacity
//         shadowColor: Colors.white.withAlpha(8),
//         // Set the text button theme to have a custom style with a light gray color
//         textButtonTheme: TextButtonThemeData(
//             style:
//                 TextButton.styleFrom(foregroundColor: AppColors.kPrimaryColor)),
//         // Set the color scheme to a dark color scheme with a light gray surface color
//         colorScheme: const ColorScheme.dark(
//           primary: AppColors.kPrimaryColor,
//           secondary: AppColors.kPrimaryColor,
//         )
//             .copyWith(surface: const Color(0xFF191A26))
//             .copyWith(error: const Color(0xFFdd3135)),
//         // Set the popup menu theme to have a dark background color
//         popupMenuTheme: const PopupMenuThemeData(
//             color: Color(0xFF29292D), surfaceTintColor: Color(0xFF29292D)),
//         // Set the dialog theme to have a light gray surface tint
//         dialogTheme: const DialogTheme(surfaceTintColor: Colors.white10),
//         // Set the floating action button theme to have a rounded shape
//         floatingActionButtonTheme: FloatingActionButtonThemeData(
//             shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(500))),
//         // Set the bottom app bar theme to have a dark background color
//         bottomAppBarTheme: const BottomAppBarTheme(
//           surfaceTintColor: Colors.black,
//           height: 60,
//           padding: EdgeInsets.symmetric(vertical: 5),
//         ),
//         // Set the divider theme to have a light gray color with a small amount of thickness
//         dividerTheme: const DividerThemeData(
//           thickness: 0.5,
//           color: Color(0xFFA0A4A8),
//         ),
//         // Set the tab bar theme to have a divider with a transparent color
//         tabBarTheme: const TabBarTheme(dividerColor: Colors.transparent),
//       );
// }
