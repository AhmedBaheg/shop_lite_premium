import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_lite_premium/core/shared_widgets/primary_button.dart';
import 'package:shop_lite_premium/core/theme/app_colors.dart';
import 'package:shop_lite_premium/core/theme/app_text_styles.dart';
import 'package:shop_lite_premium/core/utils/app_strings.dart';
import 'package:shop_lite_premium/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:shop_lite_premium/l10n/app_localizations.dart';


class AuthActionsSection extends StatelessWidget {
  const AuthActionsSection({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final localization = Localizations.of<AppLocalizations>(
      context,
      AppLocalizations,
    );
    return Column(
      children: [

        Row(
          children: [
            Expanded(
              child: Divider(color: AppColors.borderDefaultLight, thickness: 1),
            ),
            SizedBox(width: 16),
            Text(
              localization!.continueWith,
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.textSecondaryLight,
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Divider(color: AppColors.borderDefaultLight, thickness: 1),
            ),
          ],
        ),
        SizedBox(height: 24),
        Row(
          children: [
            Expanded(
              child: PrimaryButton(
                onPressed: () async {
                  await BlocProvider.of<AuthCubit>(context).signInWithGoogle();
                },
                text: localization.google,
                icon: AppStrings.googleIcon,
                isOutlineBtn: true,
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: PrimaryButton(
                onPressed: () {},
                text: localization.facebook,
                icon: AppStrings.facebookIcon,
                isOutlineBtn: true,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
