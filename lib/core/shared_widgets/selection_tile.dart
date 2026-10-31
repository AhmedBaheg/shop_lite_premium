import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../utils/app_spacing.dart';

/// Shared selectable tile used by Language and Appearance settings.
///
/// The tile is controlled by its parent: call [onTap] and rebuild with the
/// updated [isSelected] value after the selected setting has been persisted.
class SettingsSelectionTile extends StatelessWidget {
  const SettingsSelectionTile({
    super.key,
    required this.leading,
    required this.title,
    required this.subtitle,
    required this.isSelected,
    required this.onTap,
  });

  final Widget leading;
  final String title;
  final String subtitle;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final backgroundColor = isDark
        ? AppColors.backgroundCanvasDark
        : AppColors.backgroundCanvasLight;
    final borderColor = isSelected
        ? (isDark ? AppColors.contentAccentDark : AppColors.contentAccentLight)
        : (isDark ? AppColors.borderDefaultDark : AppColors.borderDefaultLight);
    final primaryText = isDark
        ? AppColors.textPrimaryDark
        : AppColors.textPrimaryLight;
    final secondaryText = isDark
        ? AppColors.textSecondaryDark
        : AppColors.textSecondaryLight;
    final selectedTint = isDark
        ? AppColors.contentAccentDark.withValues(alpha: 0.08)
        : AppColors.contentAccentLight.withValues(alpha: 0.035);

    return Semantics(
      button: true,
      selected: isSelected,
      label: '$title. $subtitle',
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(AppRadius.x16),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            curve: Curves.easeOut,
            padding: const EdgeInsets.all(AppSpacing.x16),
            decoration: BoxDecoration(
              color: isSelected ? selectedTint : backgroundColor,
              borderRadius: BorderRadius.circular(AppRadius.x16),
              border: Border.all(
                color: borderColor,
                width: isSelected ? 1.5 : 1,
              ),
            ),
            child: Row(
              children: [
                leading,
                const SizedBox(width: AppSpacing.x16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        title,
                        style: AppTextStyles.titleMedium(
                          context,
                          text: title,
                          color: primaryText,
                        ),
                      ),
                      const SizedBox(height: AppSpacing.x4),
                      Text(
                        subtitle,
                        style: AppTextStyles.bodySmall(
                          context,
                          text: subtitle,
                          color: secondaryText,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: AppSpacing.x12),
                _SelectionIndicator(
                  isSelected: isSelected,
                  color: isDark
                      ? AppColors.contentAccentDark
                      : AppColors.contentAccentLight,
                  unselectedColor: secondaryText,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SelectionIndicator extends StatelessWidget {
  const _SelectionIndicator({
    required this.isSelected,
    required this.color,
    required this.unselectedColor,
  });

  final bool isSelected;
  final Color color;
  final Color unselectedColor;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 180),
      width: 22,
      height: 22,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected ? color : unselectedColor,
          width: isSelected ? 2.4 : 1.8,
        ),
      ),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        width: isSelected ? 10 : 0,
        height: isSelected ? 10 : 0,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}

/// Neutral badge for language options; avoids assuming a country flag
/// represents a language.
class LanguageCodeBadge extends StatelessWidget {
  const LanguageCodeBadge({
    super.key,
    required this.label,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final accent = isDark
        ? AppColors.contentAccentDark
        : AppColors.contentAccentLight;
    final surface = isDark
        ? AppColors.surfaceSubtleDark
        : AppColors.surfaceSubtleLight;

    return Container(
      width: 48,
      height: 48,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: surface,
        borderRadius: BorderRadius.circular(AppRadius.x14),
      ),
      child: Text(
        label,
        style: AppTextStyles.labelLarge(
          context,
          text: label,
          color: accent,
        ),
      ),
    );
  }
}
