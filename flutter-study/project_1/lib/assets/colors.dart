import "package:flutter/material.dart";

class AppColors {
  AppColors._();
  static const Color primary = Color(0xFFE7D1B2); // Blue color
  static const Color onPrimary = Color(0xFF592821); // White on primary
  static const Color secondary = Color(0xFFB8895B); // Pink color
  static const Color onSecondary = Color(0xFFF3EBDE); // White on secondary
  static const Color error = Color(0xFFD32F2F); // Red for errors
  static const Color onError = Color(0xFFFFFFFF); // White on error
  static const Color surface = Color(0xFFFFFFFF); // White for surface
  static const Color onSurface = Color(0xFF000000); // Black on surface
  static const Color background = Color(0xFFE5CEAF); // Light background color
  static const Color onBackground = Color(0xFF000000); // Black on background

  static ThemeData get themeMain => ThemeData(
      fontFamily:"Anta",
      textTheme: const TextTheme(
        bodyLarge: TextStyle(fontSize: 16, color:primary),
        bodyMedium: TextStyle(fontFamily: "Akaya" , fontSize: 16, color:primary),
        displayLarge: TextStyle(fontFamily: "Goudy" , fontSize: 16, color:onSecondary),
        displayMedium: TextStyle(fontFamily: "Righteous" , fontSize: 16, color:primary),
      ),
        colorScheme: const ColorScheme(
            brightness: Brightness.light,
            primary: primary,
            onPrimary: onPrimary,
            secondary: secondary,
            onSecondary: onSecondary,
            error: error,
            onError: onError,
            surface: surface,
            onSurface: onSurface),
        useMaterial3: true,
      );
}
