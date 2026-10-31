import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_lite_premium/core/theme/app_text_styles.dart';

import '../theme/app_colors.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    this.textLabel,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.onSaved,
    this.validator,
    this.obscureText = false,
    this.keyboardType,
    this.onChanged,
  });

  final String? textLabel, hintText, prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(textLabel ?? '', style: AppTextStyles.labelLarge(context)),
        SizedBox(height: 8),
        TextFormField(
          decoration: InputDecoration(
            hintText: hintText,
            filled: true,
            fillColor: AppColors.surfaceSubtleLight,
            hintStyle: AppTextStyles.hint(context),
            prefixIcon: Padding(
              padding: EdgeInsetsGeometry.all(14),
              child: SvgPicture.asset(prefixIcon ?? ''),
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
          style: AppTextStyles.bodyMedium(context),
          keyboardType: keyboardType,
          onSaved: onSaved,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
