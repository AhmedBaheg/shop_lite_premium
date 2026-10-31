import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../utils/app_spacing.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
    this.height = AppSpacing.x10,
  });

  final double? height;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: height ?? AppSpacing.x10),
        Divider(height: 1, color: AppColors.borderDefaultLight),
        SizedBox(height: height ?? AppSpacing.x10),
      ],
    );
  }
}
