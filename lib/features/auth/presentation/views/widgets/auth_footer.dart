import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_lite_premium/core/theme/app_colors.dart';
import 'package:shop_lite_premium/core/theme/app_text_styles.dart';
import 'package:shop_lite_premium/features/auth/presentation/views/views/create_account_view.dart';
import 'package:shop_lite_premium/l10n/app_localizations.dart';

import '../../cubits/auth_cubit.dart';

class AuthFooter extends StatelessWidget {
  const AuthFooter({super.key, required this.isLogin});

  final bool isLogin;

  @override
  Widget build(BuildContext context) {
    final localization = Localizations.of<AppLocalizations>(
      context,
      AppLocalizations,
    );
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          isLogin
              ? localization!.newToShopLite
              : localization!.alreadyHaveAnAccount,
          style: AppTextStyles.bodyMedium(context, color: AppColors.textSecondaryLight,)
        ),
        SizedBox(width: 8),
        TextButton(
          onPressed: () {
            if (isLogin) {
              final authCubit = context.read<AuthCubit>();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BlocProvider.value(
                    value: authCubit,
                    child: CreateAccountView(),
                  ),
                ),
              );
            } else {
              Navigator.pop(context);
            }
          },
          style: TextButton.styleFrom(padding: EdgeInsets.zero),
          child: Text(
            isLogin ? localization.createAnAccount : localization.login,
            style: AppTextStyles.link(context),
          ),
        ),
      ],
    );
  }
}
