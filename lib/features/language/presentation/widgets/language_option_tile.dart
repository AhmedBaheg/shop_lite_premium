import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/app_spacing.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../l10n/app_localizations.dart';

class LanguageOptionTile extends StatelessWidget {
  const LanguageOptionTile({
    super.key,
    required this.localization,
    this.onTap,
    required this.language,
    required this.isSelected,
  });

  final AppLocalizations localization;
  final void Function()? onTap;
  final String language;
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
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: SvgPicture.asset(
                fit: BoxFit.cover,
                language == "en"
                    ? AppStrings.americaIcon
                    : AppStrings.egyptIcon,
                height: 30,
                width: 30,
              ),
            ),
            SizedBox(width: AppSpacing.x12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  language == "en"
                      ? localization.settingsEnglish
                      : localization.settingsArabic,
                  style: AppTextStyles.bodyLarge(context)
                      .copyWith(fontWeight: FontWeight.w600),
                ),
                SizedBox(height: AppSpacing.x4),
                Text(
                  language == "en"
                      ? localization.settingsEnglishDescription
                      : localization.settingsArabicDescription,
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
