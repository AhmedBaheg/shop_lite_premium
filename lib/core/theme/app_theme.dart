
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

abstract final class AppTheme {
  static ThemeData get light => _build(
    brightness: Brightness.light,
    canvas: AppColors.backgroundCanvasLight,
    surface: AppColors.surfaceSubtleLight,
    text: AppColors.textPrimaryLight,
    secondary: AppColors.textSecondaryLight,
    border: AppColors.borderDefaultLight,
    primary: AppColors.actionPrimaryLight,
  );

  static ThemeData get dark => _build(
    brightness: Brightness.dark,
    canvas: AppColors.backgroundCanvasDark,
    surface: AppColors.surfaceSubtleDark,
    text: AppColors.textPrimaryDark,
    secondary: AppColors.textSecondaryDark,
    border: AppColors.borderDefaultDark,
    primary: AppColors.actionPrimaryDark,
  );

  static ThemeData _build({
    required Brightness brightness,
    required Color canvas,
    required Color surface,
    required Color text,
    required Color secondary,
    required Color border,
    required Color primary,
  }) {
    final scheme = ColorScheme.fromSeed(
      seedColor: primary,
      brightness: brightness,
      surface: surface,
      error: AppColors.error,
    ).copyWith(
      primary: primary,
      onPrimary: Colors.white,
      onSurface: text,
      onSurfaceVariant: secondary,
      outline: border,
      outlineVariant: border,
    );

    final base = ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
    );

    return base.copyWith(
      scaffoldBackgroundColor: canvas,

      textTheme: GoogleFonts.interTextTheme(
        base.textTheme,
      ).apply(
        bodyColor: text,
        displayColor: text,
      ),

      appBarTheme: AppBarTheme(
        backgroundColor: canvas,
        foregroundColor: text,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
      ),

      cardTheme: CardThemeData(
        color: surface,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
          side: BorderSide(color: border),
        ),
      ),

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: surface,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        hintStyle: GoogleFonts.inter(
          fontSize: 14,
          color: secondary,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: border),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(
            color: primary,
            width: 1.5,
          ),
        ),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primary,
          foregroundColor: Colors.white,
          minimumSize: const Size.fromHeight(52),
          elevation: 0,
          textStyle: GoogleFonts.inter(
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
      ),

      dividerTheme: DividerThemeData(
        color: border,
        thickness: 1,
      ),
    );
  }
}
