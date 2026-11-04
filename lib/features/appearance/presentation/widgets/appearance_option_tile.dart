import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/app_spacing.dart';
import '../../../../l10n/app_localizations.dart';

class AppearanceOptionTile extends StatelessWidget {
  const AppearanceOptionTile({
    super.key,
    required this.localization,
    this.onTap,
    required this.appearance,
    required this.isSelected,
  });

  final AppLocalizations localization;
  final void Function()? onTap;
  final String appearance;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.backgroundCanvasLight,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected
                ? AppColors.actionPrimaryLight
                : AppColors.borderDefaultLight,
            width:  isSelected ? 1 : 2,
          ),
        ),
        child: Row(
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: isSelected
                    ? AppColors.actionPrimaryLight.withValues(alpha: 0.1)
                    : AppColors.backgroundCanvasLight,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                appearance == "light"
                    ? Icons.light_mode_outlined
                    : Icons.dark_mode_outlined,
                color: isSelected
                    ? AppColors.actionPrimaryLight
                    : AppColors.textPrimaryLight,
              ),
            ),
            SizedBox(width: AppSpacing.x12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  appearance == "light"
                      ? localization.profileLight
                      : localization.profileDark,
                  style: AppTextStyles.bodyLarge(context)
                      .copyWith(fontWeight: FontWeight.w600),
                ),
                SizedBox(height: AppSpacing.x4),
                Text(
                  appearance == "light"
                      ? localization.settingsLightDescription
                      : localization.settingsDarkDescription,
                  style: AppTextStyles.bodySmall(
                    context,
                    color: AppColors.textSecondaryLight,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Container(
              height: 24,
              width: 24,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: isSelected
                      ? AppColors.actionPrimaryLight
                      : AppColors.borderDefaultLight,
                  width: 2,
                ),
              ),
              child: Container(
                margin: const EdgeInsets.all(4),
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppColors.actionPrimaryLight
                      : AppColors.backgroundCanvasLight,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
