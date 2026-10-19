import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_text_styles.dart';

/// ShopLite theme setup matching the attached Light/Dark screen references.
/// In MaterialApp use: theme: AppTheme.light, darkTheme: AppTheme.dark.
abstract final class AppTheme {
  /// ثيم فاتح: خلفية بيضاء، حقول رمادية فاتحة، ونصوص كحلية.
  static ThemeData get light => _buildTheme(
        brightness: Brightness.light,
        primaryText: AppColors.lightTextPrimary,
        secondaryText: AppColors.lightTextSecondary,
        hintText: AppColors.lightTextHint,
        background: AppColors.lightBackground,
        surface: AppColors.lightSurface,
        surfaceVariant: AppColors.lightSurfaceVariant,
        border: AppColors.lightBorder,
        disabled: AppColors.lightDisabled,
        selectedSurface: AppColors.primarySoft,
      );

  /// ثيم داكن: خلفية #0E1624 وحقول/أسطح ثانوية #172234 ونص فاتح.
  static ThemeData get dark => _buildTheme(
        brightness: Brightness.dark,
        primaryText: AppColors.darkTextPrimary,
        secondaryText: AppColors.darkTextSecondary,
        hintText: AppColors.darkTextHint,
        background: AppColors.darkBackground,
        surface: AppColors.darkSurface,
        surfaceVariant: AppColors.darkSurfaceVariant,
        border: AppColors.darkBorder,
        disabled: AppColors.darkDisabled,
        selectedSurface: AppColors.primarySoftDark,
      );

  static ThemeData _buildTheme({
    required Brightness brightness,
    required Color primaryText,
    required Color secondaryText,
    required Color hintText,
    required Color background,
    required Color surface,
    required Color surfaceVariant,
    required Color border,
    required Color disabled,
    required Color selectedSurface,
  }) {
    final isDark = brightness == Brightness.dark;
    final scheme = ColorScheme(
      brightness: brightness,
      primary: AppColors.primary,
      onPrimary: AppColors.white,
      secondary: selectedSurface,
      onSecondary: primaryText,
      error: AppColors.error,
      onError: AppColors.white,
      surface: surface,
      onSurface: primaryText,
      outline: border,
      outlineVariant: border,
      surfaceContainerHighest: surfaceVariant,
      shadow: Colors.black,
      scrim: AppColors.scrim,
    );

    return ThemeData(
      useMaterial3: true,
      fontFamily: 'Cairo',
      brightness: brightness,
      colorScheme: scheme,
      scaffoldBackgroundColor: background,
      disabledColor: disabled,
      dividerColor: border,
      textTheme: AppTextStyles.themed(
        primaryText: primaryText,
        secondaryText: secondaryText,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: background,
        foregroundColor: primaryText,
        elevation: 0,
        centerTitle: false,
        surfaceTintColor: Colors.transparent,
        titleTextStyle: AppTextStyles.titleMedium.copyWith(color: primaryText),
      ),
      cardTheme: CardThemeData(
        color: surface,
        elevation: 0,
        shadowColor: Colors.black.withValues(alpha: isDark ? 0 : 0.03),
        surfaceTintColor: Colors.transparent,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: isDark ? border : Colors.transparent),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: surfaceVariant,
        hintStyle: AppTextStyles.bodySmall.copyWith(color: hintText),
        labelStyle: AppTextStyles.labelMedium.copyWith(color: secondaryText),
        errorStyle: AppTextStyles.bodySmall.copyWith(color: AppColors.error),
        contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: border, width: 0.7),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: isDark ? border : Colors.transparent, width: 0.7),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.primary, width: 1.3),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.error, width: 1.3),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.white,
          disabledBackgroundColor: disabled,
          disabledForegroundColor: secondaryText,
          elevation: 0,
          minimumSize: const Size(48, 48),
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
          textStyle: AppTextStyles.labelLarge.copyWith(color: AppColors.white),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: primaryText,
          minimumSize: const Size(48, 44),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          side: BorderSide(color: border),
          textStyle: AppTextStyles.labelMedium.copyWith(color: primaryText),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.primary,
          textStyle: AppTextStyles.labelMedium.copyWith(color: AppColors.primary),
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: surface,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: secondaryText,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        selectedLabelStyle: AppTextStyles.labelSmall.copyWith(color: AppColors.primary),
        unselectedLabelStyle: AppTextStyles.labelSmall.copyWith(color: secondaryText),
      ),
    );
  }
}
