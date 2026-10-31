import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/app_spacing.dart';
import '../../../../core/utils/app_strings.dart';

class ProfileMenuItem extends StatelessWidget {
  const ProfileMenuItem({
    super.key,
    required this.icon,
    required this.title,
    this.value,
    this.onTap,
    this.arrowIcon = true,
  });

  final String icon;
  final bool arrowIcon;
  final String title;
  final String? value;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.x16),
        child: Row(
          children: [
            SvgPicture.asset(icon, width: 20, height: 20),
            const SizedBox(width: AppSpacing.x14),
            Expanded(
              child: Text(
                title,
                style: arrowIcon
                    ? AppTextStyles.bodyMedium(context, text: title)
                    : AppTextStyles.bodyMedium(
                        context,
                        text: title,
                        color: AppColors.actionPrimaryLight,
                      ),
              ),
            ),
            if (value != null) ...[
              Text(
                value!,
                style: AppTextStyles.bodySmall(context, text: value),
              ),
              const SizedBox(width: AppSpacing.x12),
            ],
            if (arrowIcon) ...[
              const SizedBox(),
              SvgPicture.asset(
                AppStrings.chevronRightIcon,
                width: 20,
                height: 20,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
