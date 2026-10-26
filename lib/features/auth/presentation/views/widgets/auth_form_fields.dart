import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_lite_premium/core/shared_widgets/app_text_form_field.dart';
import 'package:shop_lite_premium/core/utils/app_strings.dart';
import 'package:shop_lite_premium/core/utils/validation.dart';
import 'package:shop_lite_premium/l10n/app_localizations.dart';

class AuthFormFields extends StatefulWidget {
  const AuthFormFields({
    super.key,
    required this.isLogin,
    this.onEmailSaved,
    this.onPasswordSaved,
    this.onNameSaved,
  });

  final bool isLogin;
  final Function(String?)? onEmailSaved;
  final Function(String?)? onPasswordSaved;
  final Function(String?)? onNameSaved;

  @override
  State<AuthFormFields> createState() => _AuthFormFieldsState();
}

class _AuthFormFieldsState extends State<AuthFormFields> {
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    final localization = Localizations.of<AppLocalizations>(
      context,
      AppLocalizations,
    );
    return Column(
      children: [
        widget.isLogin
            ? SizedBox()
            : AppTextFormField(
                textLabel: localization!.fullName,
                hintText: localization.fullName,
                prefixIcon: AppStrings.userIcon,
                onSaved: widget.onNameSaved,
                keyboardType: TextInputType.name,
                validator: (value) => Validation.validateName(value!),
              ),
        SizedBox(height: 20),
        AppTextFormField(
          textLabel: localization!.email,
          hintText: localization.emailHint,
          prefixIcon: AppStrings.emailIcon,
          onSaved: widget.onEmailSaved,
          keyboardType: TextInputType.emailAddress,
          validator: (value) => Validation.validateEmail(value!),
        ),
        SizedBox(height: 20),
        AppTextFormField(
          obscureText: isVisible,
          textLabel: localization.password,
          hintText: localization.passwordHint,
          prefixIcon: AppStrings.lockIcon,
          suffixIcon: InkWell(
            onTap: () {
              setState(() {
                isVisible = !isVisible;
              });
            },
            child: SvgPicture.asset(
              isVisible ? AppStrings.eyeOffIcon : AppStrings.eyeOnIcon,
              width: 24,
              height: 24,
            ),
          ),
          onSaved: widget.onPasswordSaved,
          validator: (value) => Validation.validatePassword(value!),
        ),
      ],
    );
  }
}
