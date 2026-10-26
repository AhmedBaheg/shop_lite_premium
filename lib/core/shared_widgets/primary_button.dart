import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.icon,
    this.isLoading = false,
    this.isOutlineBtn = false,
  });

  final VoidCallback? onPressed;
  final String? text;
  final String? icon;
  final bool isLoading;
  final bool isOutlineBtn;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(double.infinity, 50),
        backgroundColor: isOutlineBtn
            ? AppColors.transparent
            : AppColors.actionPrimaryLight,
        shadowColor: Colors.transparent,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: isOutlineBtn
              ? BorderSide(color: AppColors.borderDefaultLight, width: 1)
              : BorderSide.none,
        ),
      ),
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: Center(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            child: isLoading
                ? SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(
                      strokeWidth: 2.5,
                      color: AppColors.white,
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      icon != null
                          ? Row(
                              children: [
                                SvgPicture.asset(icon!, width: 20, height: 20),
                                const SizedBox(width: 10),
                              ],
                            )
                          : const SizedBox(),
                      Text(
                        text ?? '',
                        style: isOutlineBtn
                            ? AppTextStyles.button.copyWith(
                                color: AppColors.textPrimaryLight,
                              )
                            : AppTextStyles.button,
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}

bool isEnglish(BuildContext context) {
  return Localizations.localeOf(context).languageCode == 'en';
}
