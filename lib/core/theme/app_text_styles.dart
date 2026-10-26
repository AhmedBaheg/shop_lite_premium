import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_lite_premium/core/theme/app_colors.dart';

/// Typography system for ShopLite.
/// One font family (Cairo) is used for both Arabic and English text.
/// Colors are supplied by the active Theme, so these styles work in Light/Dark.
abstract final class AppTextStyles {
  // Cairo is used consistently for both scripts.
  static TextStyle get _base => GoogleFonts.inter();

  // ---------------------------------------------------------------------------
  // DISPLAY — Large, rare-use promotional headings
  // ---------------------------------------------------------------------------

  /// 32px / Bold — ShopLite wordmark on Splash or a single hero headline.
  /// Avoid using it for normal page titles to keep the UI calm.
  static TextStyle get displayLarge => _base.copyWith(
        fontSize: 38,
        fontWeight: FontWeight.w700,
        height: 1.2,
        letterSpacing: -0.3,
      );

  /// 28px / Bold — Welcome/confirmation message when there is enough space.
  static TextStyle get displayMedium => _base.copyWith(
        fontSize: 28,
        fontWeight: FontWeight.w700,
        height: 1.25,
      );

  // ---------------------------------------------------------------------------
  // HEADLINES — Page and section headings
  // ---------------------------------------------------------------------------

  /// 24px / Bold — Main page title, e.g. Welcome Back or Shopping Cart.
  static TextStyle get headlineLarge => _base.copyWith(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        height: 1.3,
      );

  /// 22px / SemiBold — Compact page title or a secondary main heading.
  static TextStyle get headlineMedium => _base.copyWith(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        height: 1.35,
      );

  /// 20px / SemiBold — Section headings, e.g. Featured Products or Order Summary.
  static TextStyle get headlineSmall => _base.copyWith(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        height: 1.4,
      );

  // ---------------------------------------------------------------------------
  // TITLES — Product and component titles
  // ---------------------------------------------------------------------------

  /// 18px / Bold — Product name on its details page or an important value.
  static TextStyle get titleLarge => _base.copyWith(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        height: 1.4,
      );

  /// 16px / SemiBold — Product names in lists and titles within account rows.
  static TextStyle get titleMedium => _base.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        height: 1.45,
      );

  /// 14px / SemiBold — Compact product cards and short category names.
  static TextStyle get titleSmall => _base.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        height: 1.45,
      );

  // ---------------------------------------------------------------------------
  // BODY — Readable descriptions and content
  // ---------------------------------------------------------------------------

  /// 16px / Regular — Main descriptions and instructions.
  static TextStyle get bodyLarge => _base.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        height: 1.65,
      );

  /// 14px / Regular — Default body text, product information, and form copy.
  static TextStyle get bodyMedium => _base.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        height: 1.6,
      );

  /// 12px / Regular — Short metadata, review counts, and supporting hints.
  /// Avoid this size for important information or long paragraphs.
  static TextStyle get bodySmall => _base.copyWith(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        height: 1.5,
      );

  // ---------------------------------------------------------------------------
  // LABELS — Buttons, filters, tabs, and controls
  // ---------------------------------------------------------------------------

  /// 14px / Bold — Primary CTA labels: Sign In, Create Account, Add to Cart.
  static TextStyle get labelLarge => _base.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        height: 1.4,
      );

  /// 12px / SemiBold — Category chips, compact filters, and secondary controls.
  static TextStyle get labelMedium => _base.copyWith(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        height: 1.4,
      );

  /// 11px / SemiBold — Very small navigation labels and low-priority metadata.
  /// Use sparingly; prefer 12px when the text matters.
  static TextStyle get labelSmall => _base.copyWith(
        fontSize: 11,
        fontWeight: FontWeight.w600,
        height: 1.35,
      );

  // ---------------------------------------------------------------------------
  // SPECIAL PURPOSE — Links, prices, and form hints
  // ---------------------------------------------------------------------------

  /// 14px / SemiBold — Forgot Password, Sign Up, See All, and inline links.
  static TextStyle get link => _base.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        height: 1.4,
        color: AppColors.actionPrimaryLight,
      );

  /// 20px / Bold — Main product price or total value.
  static TextStyle get priceLarge => _base.copyWith(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        height: 1.35,
      );

  /// 14px / Medium — Small/secondary prices in product cards.
  static TextStyle get priceMedium => _base.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        height: 1.4,
      );

  /// 12px / Regular — Hint text and field helper messages.
  static TextStyle get hint => _base.copyWith(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        height: 1.5,
      );

  /// 14px / SemiBold — Shared text style for primary buttons.
  static TextStyle get button => _base.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        height: 1.4,
        color: AppColors.white,
      );

  /// Returns a Material TextTheme using the ShopLite font sizes and theme colors.
  /// Pass the active ColorScheme colors so Light/Dark themes remain consistent.
  static TextTheme themed({
    required Color primaryText,
    required Color secondaryText,
  }) {
    return TextTheme(
      displayLarge: displayLarge.copyWith(color: primaryText),
      displayMedium: displayMedium.copyWith(color: primaryText),
      headlineLarge: headlineLarge.copyWith(color: primaryText),
      headlineMedium: headlineMedium.copyWith(color: primaryText),
      headlineSmall: headlineSmall.copyWith(color: primaryText),
      titleLarge: titleLarge.copyWith(color: primaryText),
      titleMedium: titleMedium.copyWith(color: primaryText),
      titleSmall: titleSmall.copyWith(color: primaryText),
      bodyLarge: bodyLarge.copyWith(color: primaryText),
      bodyMedium: bodyMedium.copyWith(color: primaryText),
      bodySmall: bodySmall.copyWith(color: secondaryText),
      labelLarge: labelLarge.copyWith(color: primaryText),
      labelMedium: labelMedium.copyWith(color: secondaryText),
      labelSmall: labelSmall.copyWith(color: secondaryText),
    );
  }
}
