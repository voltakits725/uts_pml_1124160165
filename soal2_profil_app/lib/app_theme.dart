import 'package:flutter/material.dart';

ThemeData buildProfileTheme(){
  final ColorScheme cs = ColorScheme.fromSeed(seedColor: Colors.teal);
  const Color latar = Color(0xFFF4F5FA);

  return ThemeData(
    useMaterial3: true,
    colorScheme: cs,
    scaffoldBackgroundColor: latar,
    appBarTheme: AppBarTheme(
      backgroundColor: latar,
      surfaceTintColor: Colors.transparent,
      elevation: 8,
      titleTextStyle: TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w700,
        color: cs.onSurface,
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      labelStyle: TextStyle(fontSize: 13, color: cs.onSurfaceVariant),
      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      border: _garis(const Color(0xFFE2E2EC)),
      enabledBorder: _garis(cs.primary, width: 1.5),
      focusedBorder: _garis(cs.error),
      errorBorder: _garis(cs.error, width: 1.5),
      focusedErrorBorder: _garis(cs.error, width: 1.5),
    ),
    snackBarTheme: const SnackBarThemeData(
      behavior: SnackBarBehavior.floating,
      insetPadding: EdgeInsets.all(16),
    )
  );

  
}

OutlineInputBorder _garis(Color color, {double width = 1}) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(20),
    borderSide: BorderSide(color: color, width: width),
  );
}