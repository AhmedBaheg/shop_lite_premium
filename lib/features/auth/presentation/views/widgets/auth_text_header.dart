import 'package:flutter/material.dart';
import 'package:shop_lite_premium/core/theme/app_colors.dart';
import 'package:shop_lite_premium/core/theme/app_text_styles.dart';

class AuthTextHeader extends StatelessWidget {
  const AuthTextHeader({
    super.key,
    required this.title,
    required this.subTitle,
  });

  final String title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyles.displayLarge.copyWith(
            color: AppColors.textPrimaryLight,
          ),
        ),
        SizedBox(height: 8),
        Text(
          subTitle,
          style: AppTextStyles.bodyLarge.copyWith(
            color: AppColors.textPrimaryLight,
          ),
        ),
      ],
    );
  }
}
