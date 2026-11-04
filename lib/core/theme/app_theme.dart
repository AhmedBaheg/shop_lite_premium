
import 'package:flutter/material.dart';
import 'app_colors.dart';

abstract final class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.backgroundCanvasLight,

    colorScheme: const ColorScheme.light(
      primary: AppColors.contentAccentLight,
      surface: AppColors.backgroundCanvasLight,
      onSurface: AppColors.textPrimaryLight,
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.backgroundCanvasLight,
      foregroundColor: AppColors.textPrimaryLight,
      iconTheme: IconThemeData(color: AppColors.textPrimaryLight),
      titleTextStyle: TextStyle(
        color: AppColors.textPrimaryLight,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
      elevation: 0,
    ),

    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: AppColors.textPrimaryLight),
      bodyMedium: TextStyle(color: AppColors.textPrimaryLight),
      bodySmall: TextStyle(color: AppColors.textSecondaryLight),
      titleLarge: TextStyle(color: AppColors.textPrimaryLight),
      titleMedium: TextStyle(color: AppColors.textPrimaryLight),
      titleSmall: TextStyle(color: AppColors.textPrimaryLight),
    ),

    iconTheme: const IconThemeData(
      color: AppColors.textPrimaryLight,
    ),

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.backgroundCanvasLight,
      selectedItemColor: AppColors.actionPrimaryLight,
      unselectedItemColor: AppColors.textSecondaryLight,
      type: BottomNavigationBarType.fixed,
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.backgroundCanvasDark,

    colorScheme: const ColorScheme.dark(
      primary: AppColors.contentAccentDark,
      surface: AppColors.backgroundCanvasDark,
      onSurface: AppColors.textPrimaryDark,
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.backgroundCanvasDark,
      foregroundColor: AppColors.textPrimaryDark,
      iconTheme: IconThemeData(color: AppColors.textPrimaryDark),
      titleTextStyle: TextStyle(
        color: AppColors.textPrimaryDark,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
      elevation: 0,
    ),

    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: AppColors.textPrimaryDark),
      bodyMedium: TextStyle(color: AppColors.textPrimaryDark),
      bodySmall: TextStyle(color: AppColors.textSecondaryDark),
      titleLarge: TextStyle(color: AppColors.textPrimaryDark),
      titleMedium: TextStyle(color: AppColors.textPrimaryDark),
      titleSmall: TextStyle(color: AppColors.textPrimaryDark),
    ),

    iconTheme: const IconThemeData(
      color: AppColors.textPrimaryDark,
    ),

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.backgroundCanvasDark,
      selectedItemColor: AppColors.contentAccentDark,
      unselectedItemColor: AppColors.textSecondaryDark,
      type: BottomNavigationBarType.fixed,
    ),
  );
}
