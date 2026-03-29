import 'package:flutter/material.dart';

class AppColors {
  // Rich jewel-tone palette
  static const Color deepNavy = Color(0xFF0A0E27);
  static const Color royalIndigo = Color(0xFF1B1F4A);
  static const Color gold = Color(0xFFD4A853);
  static const Color goldLight = Color(0xFFF0C96B);
  static const Color cream = Color(0xFFFAF6EF);
  static const Color roseGold = Color(0xFFC9837A);
  static const Color emerald = Color(0xFF2D7D67);
  static const Color emeraldLight = Color(0xFF3DA882);
  static const Color cardDark = Color(0xFF161A3D);
  static const Color textLight = Color(0xFFE8E4DC);
  static const Color textMuted = Color(0xFF9B97A8);
  static const Color divider = Color(0xFF2A2F5C);
}

class AppTheme {
  static ThemeData get dark => ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.deepNavy,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.gold,
      secondary: AppColors.emerald,
      surface: AppColors.cardDark,
      background: AppColors.deepNavy,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontFamily: 'serif',
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: AppColors.textLight,
        letterSpacing: 0.5,
      ),
      iconTheme: IconThemeData(color: AppColors.textLight),
    ),
    cardTheme: CardTheme(
      color: AppColors.cardDark,
      elevation: 8,
      shadowColor: Colors.black54,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.royalIndigo,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: AppColors.divider),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: AppColors.divider),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: AppColors.gold, width: 1.5),
      ),
      labelStyle: const TextStyle(color: AppColors.textMuted),
      hintStyle: const TextStyle(color: AppColors.textMuted),
      contentPadding:
      const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.gold,
        foregroundColor: AppColors.deepNavy,
        padding:
        const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.5,
        ),
        elevation: 4,
      ),
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        color: AppColors.textLight,
        fontSize: 36,
        fontWeight: FontWeight.w800,
      ),
      titleLarge: TextStyle(
        color: AppColors.textLight,
        fontSize: 20,
        fontWeight: FontWeight.w700,
      ),
      bodyLarge: TextStyle(color: AppColors.textLight, fontSize: 16),
      bodyMedium: TextStyle(color: AppColors.textMuted, fontSize: 14),
    ),
  );
}
