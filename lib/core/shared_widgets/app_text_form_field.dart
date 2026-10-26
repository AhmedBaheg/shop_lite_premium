import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_lite_premium/core/theme/app_text_styles.dart';

import '../theme/app_colors.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    required this.textLabel,
    required this.hintText,
    required this.prefixIcon,
    this.suffixIcon,
    required this.onSaved,
    required this.validator,
    this.obscureText = false, this.keyboardType,
  });

  final String textLabel, hintText, prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(textLabel, style: AppTextStyles.labelLarge),
        SizedBox(height: 8),
        TextFormField(
          decoration: InputDecoration(
            hintText: hintText,
            filled: true,
            fillColor: AppColors.surfaceSubtleLight,
            hintStyle: AppTextStyles.hint,
            prefixIcon: Padding(
              padding: EdgeInsetsGeometry.all(14),
              child: SvgPicture.asset(prefixIcon),
            ),
            suffixIcon: Padding(
              padding: EdgeInsetsGeometry.all(14),
              child: suffixIcon,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide.none,
            ),
          ),
          validator: validator,
          obscureText: obscureText,
          cursorColor: AppColors.textPrimaryLight,
          style: AppTextStyles.bodyMedium,
          keyboardType: keyboardType,
          onSaved: onSaved,
        ),
      ],
    );
  }
}
