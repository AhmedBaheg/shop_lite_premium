import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_lite_premium/core/theme/app_colors.dart';
import 'package:shop_lite_premium/core/theme/app_text_styles.dart';
import 'package:shop_lite_premium/features/home_view.dart';
import 'package:shop_lite_premium/l10n/app_localizations.dart';

import '../../../../../core/shared_widgets/primary_button.dart';
import '../../../../product/presentation/views/product_view.dart';
import '../../../domain/entities/user_entity.dart';
import '../../cubits/auth_cubit.dart';
import '../widgets/auth_actions_section.dart';
import '../widgets/auth_brand_header.dart';
import '../widgets/auth_footer.dart';
import '../widgets/auth_form_fields.dart';
import '../widgets/auth_text_header.dart';

class CreateAccountView extends StatelessWidget {
  CreateAccountView({super.key});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  String name = "";

  @override
  Widget build(BuildContext context) {
    final localization = Localizations.of<AppLocalizations>(
      context,
      AppLocalizations,
    );
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthCreateAccountSuccess) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => HomeView()),
            (route) => false,
          );
        } else if (state is AuthFailure) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }else if(state is AuthLoginWithGoogleSuccess){
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => ProductView()),
                (route) => false,
          );
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 50),
                    AuthBrandHeader(),
                    SizedBox(height: 30),
                    AuthTextHeader(
                      title: localization!.makeYour,
                      subTitle: localization.makeYourSubTitle,
                    ),
                    SizedBox(height: 30),
                    AuthFormFields(
                      isLogin: false,
                      onEmailSaved: (value) {
                        email = value!;
                      },
                      onPasswordSaved: (value) {
                        password = value!;
                      },
                      onNameSaved: (value) {
                        name = value!;
                      },
                    ),
                    SizedBox(height: 20),
                    Text(
                      localization.policy,
                      style: AppTextStyles.bodySmall(context, color: AppColors.textSecondaryLight),
                    ),
                    SizedBox(height: 20),
                    BlocBuilder<AuthCubit, AuthState>(
                      builder: (context, state) {
                        return Column(
                          children: [
                            PrimaryButton(
                              isLoading: state is AuthLoading,
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  formKey.currentState!.save();
                                  context.read<AuthCubit>().createAccount(
                                    userEntity: UserEntity(
                                      email: email,
                                      password: password,
                                      name: name,
                                    ),
                                  );
                                }
                              },
                              text: localization!.createAccount,
                            ),
                          ],
                        );
                      },
                    ),
                    SizedBox(height: 28),
                    AuthActionsSection(),
                    SizedBox(height: 50),
                    AuthFooter(isLogin: false),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
