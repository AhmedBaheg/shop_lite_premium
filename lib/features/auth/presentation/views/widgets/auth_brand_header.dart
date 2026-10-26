import 'package:flutter/material.dart';
import 'package:shop_lite_premium/core/theme/app_colors.dart';
import 'package:shop_lite_premium/core/theme/app_text_styles.dart';
import 'package:shop_lite_premium/core/utils/app_strings.dart';
import 'package:shop_lite_premium/l10n/app_localizations.dart';

class AuthBrandHeader extends StatelessWidget {
  const AuthBrandHeader({super.key,});


  @override
  Widget build(BuildContext context) {
    final localization = Localizations.of<AppLocalizations>(
      context,
      AppLocalizations,
    );
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(AppStrings.logoApp, width: 50, height: 50),
        SizedBox(width: 10),
        RichText(
          text: TextSpan(
            text: localization!.shop,
            style: AppTextStyles.displayMedium.copyWith(
              color: AppColors.textPrimaryLight,
            ),
            children: [
              TextSpan(
                text: localization.lite,
                style: AppTextStyles.displayMedium.copyWith(
                  color: AppColors.actionPrimaryLight,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
