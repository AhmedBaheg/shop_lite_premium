import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_lite_premium/core/shared_widgets/app_text_form_field.dart';
import 'package:shop_lite_premium/core/shared_widgets/primary_button.dart';
import 'package:shop_lite_premium/core/theme/app_colors.dart';
import 'package:shop_lite_premium/core/theme/app_text_styles.dart';
import 'package:shop_lite_premium/core/utils/app_strings.dart';
import 'package:shop_lite_premium/core/utils/validation.dart';
import 'package:shop_lite_premium/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:shop_lite_premium/features/auth/presentation/views/widgets/auth_text_header.dart';
import 'package:shop_lite_premium/l10n/app_localizations.dart';

class ForgotPasswordView extends StatelessWidget {
  ForgotPasswordView({super.key});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String email = "";

  @override
  Widget build(BuildContext context) {
    final localization = Localizations.of<AppLocalizations>(
      context,
      AppLocalizations,
    );
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthForgotPasswordSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(localization.checkYourEmail),
            ),
          );
          if (Navigator.of(context).canPop()) {
            Navigator.of(context).pop();
          }
        }else if (state is AuthFailure) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
              localization!.resetPassword, style: AppTextStyles.headlineMedium),
          backgroundColor: AppColors.backgroundCanvasLight,
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 52),
                  Container(
                    padding: EdgeInsets.all(20),
                    width: 68,
                    height: 68,
                    decoration: BoxDecoration(
                      color: AppColors.contentAccentLight.withValues(
                          alpha: 0.05),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: SvgPicture.asset(
                      AppStrings.keyIcon,
                      width: 25,
                      height: 25,
                    ),
                  ),
                  SizedBox(height: 28),
                  AuthTextHeader(
                    title: localization.forgotPassword,
                    subTitle: localization.forgotPasswordSubTitle,
                  ),
                  SizedBox(height: 28),
                  AppTextFormField(
                    textLabel: localization.email,
                    hintText: localization.emailHint,
                    keyboardType: TextInputType.emailAddress,
                    prefixIcon: AppStrings.emailIcon,
                    onSaved: (value) => email = value!,
                    validator: (value) => Validation.validateEmail(value!),
                  ),
                  SizedBox(height: 28),
                  BlocBuilder<AuthCubit, AuthState>(
                    builder: (context, state) {
                      return PrimaryButton(
                        isLoading: state is AuthLoading,
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();
                            context.read<AuthCubit>().forgotPassword(
                                email: email);
                          }
                        },
                        text: localization.sendResetLink,
                      );
                    },
                  ),
                  SizedBox(height: 28),
                  Text(
                    localization.checkYourEmail,
                    style: AppTextStyles.bodySmall.copyWith(
                      color: AppColors.textSecondaryLight,
                    ),
                  ),
                  SizedBox(height: 250),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        localization.backToLogIn,
                        style: AppTextStyles.link,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
