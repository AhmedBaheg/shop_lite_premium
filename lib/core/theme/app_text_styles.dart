import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

/// ShopLite typography.
/// One shared style API works for both English and Arabic. Pass the displayed
/// text to `text:` and the font family is selected automatically:
/// Latin -> Inter; Arabic -> Noto Sans Arabic (as defined in Figma).
/// Colors follow the active Theme so the styles work in Light and Dark modes.
abstract final class AppTextStyles {
  static final RegExp _arabicPattern = RegExp(
    r'[\u0600-\u06FF\u0750-\u077F\u08A0-\u08FF\uFB50-\uFDFF\uFE70-\uFEFF]',
  );

  static bool containsArabic(String? text) =>
      text != null && _arabicPattern.hasMatch(text);

  static TextStyle _style(
    BuildContext context, {
    String? text,
    required double fontSize,
    FontWeight fontWeight = FontWeight.w400,
    double height = 1.4,
    double letterSpacing = 0,
    Color? color,
  }) {
    final isArabic = containsArabic(text);
    final resolvedColor = color ?? Theme.of(context).colorScheme.onSurface;

    if (isArabic) {
      return GoogleFonts.notoSansArabic(
        fontSize: fontSize,
        fontWeight: fontWeight,
        height: height,
        letterSpacing: letterSpacing,
        color: resolvedColor,
      );
    }

    return GoogleFonts.inter(
      fontSize: fontSize,
      fontWeight: fontWeight,
      height: height,
      letterSpacing: letterSpacing,
      color: resolvedColor,
    );
  }

  // DISPLAY — one-off large promotional or success headings.
  static TextStyle displayLarge(
    BuildContext context, {
    String? text,
    Color? color,
  }) => _style(
    context,
    text: text,
    fontSize: 32,
    fontWeight: FontWeight.w700,
    height: 1.25,
    color: color,
  );

  static TextStyle displayMedium(
    BuildContext context, {
    String? text,
    Color? color,
  }) => _style(
    context,
    text: text,
    fontSize: 28,
    fontWeight: FontWeight.w700,
    height: 1.3,
    color: color,
  );

  // HEADLINES — page and section headings. Figma's named Heading style is 24px,
  // Semi Bold, 140% line height and 0 letter spacing.
  static TextStyle headlineLarge(
    BuildContext context, {
    String? text,
    Color? color,
  }) => _style(
    context,
    text: text,
    fontSize: 24,
    fontWeight: FontWeight.w600,
    height: 1.4,
    color: color,
  );

  static TextStyle headlineMedium(
    BuildContext context, {
    String? text,
    Color? color,
  }) => _style(
    context,
    text: text,
    fontSize: 22,
    fontWeight: FontWeight.w600,
    height: 1.4,
    color: color,
  );

  static TextStyle headlineSmall(
    BuildContext context, {
    String? text,
    Color? color,
  }) => _style(
    context,
    text: text,
    fontSize: 20,
    fontWeight: FontWeight.w600,
    height: 1.4,
    color: color,
  );

  // TITLES — product names, card titles, order/account rows.
  static TextStyle titleLarge(
    BuildContext context, {
    String? text,
    Color? color,
  }) => _style(
    context,
    text: text,
    fontSize: 18,
    fontWeight: FontWeight.w600,
    height: 1.4,
    color: color,
  );

  static TextStyle titleMedium(
    BuildContext context, {
    String? text,
    Color? color,
  }) => _style(
    context,
    text: text,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 1.4,
    color: color ?? AppColors.textPrimaryLight,
  );

  static TextStyle titleSmall(
    BuildContext context, {
    String? text,
    Color? color,
  }) => _style(
    context,
    text: text,
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 1.4,
    color: color,
  );

  // BODY — descriptions, field text, help and supporting content.
  static TextStyle bodyLarge(
    BuildContext context, {
    String? text,
    Color? color,
  }) => _style(context, text: text, fontSize: 16, height: 1.5, color: color);

  static TextStyle bodyMedium(
    BuildContext context, {
    String? text,
    Color? color,
  }) => _style(context, text: text, fontSize: 14, height: 1.5, color: color);

  static TextStyle bodySmall(
    BuildContext context, {
    String? text,
    Color? color,
  }) => _style(
    context,
    text: text,
    fontSize: 12,
    height: 1.4,
    color: color ?? Theme.of(context).colorScheme.onSurfaceVariant,
  );

  // LABELS — controls, tabs, category chips and short metadata.
  static TextStyle labelLarge(
    BuildContext context, {
    String? text,
    Color? color,
  }) => _style(
    context,
    text: text,
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 1.35,
    color: color,
  );

  static TextStyle labelMedium(
    BuildContext context, {
    String? text,
    Color? color,
  }) => _style(
    context,
    text: text,
    fontSize: 12,
    fontWeight: FontWeight.w600,
    height: 1.35,
    color: color ?? Theme.of(context).colorScheme.onSurfaceVariant,
  );

  static TextStyle labelSmall(
    BuildContext context, {
    String? text,
    Color? color,
  }) => _style(
    context,
    text: text,
    fontSize: 11,
    fontWeight: FontWeight.w600,
    height: 1.35,
    color: color ?? Theme.of(context).colorScheme.onSurfaceVariant,
  );

  // Product price, main total and inline links.
  static TextStyle priceLarge(
    BuildContext context, {
    String? text,
    Color? color,
  }) => _style(
    context,
    text: text,
    fontSize: 24,
    fontWeight: FontWeight.w700,
    height: 1.25,
    color: color,
  );

  static TextStyle priceMedium(
    BuildContext context, {
    String? text,
    Color? color,
  }) => _style(
    context,
    text: text,
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 1.4,
    color: color,
  );

  static TextStyle hint(
      BuildContext context, {
        String? text,
        Color? color,
      }) => _style(
    context,
    text: text,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.4,
    color: color ?? AppColors.textSecondaryLight,
  );

  static TextStyle link(BuildContext context, {String? text, Color? color}) =>
      _style(
        context,
        text: text,
        fontSize: 13,
        fontWeight: FontWeight.w600,
        height: 1.4,
        color: color ?? AppColors.actionPrimaryLight,
      );

  static TextStyle button(BuildContext context, {String? text, Color? color}) =>
      _style(
        context,
        text: text,
        fontSize: 14,
        fontWeight: FontWeight.w600,
        height: 1.35,
        color: color ?? Theme.of(context).colorScheme.onPrimary,
      );
}
