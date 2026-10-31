import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_lite_premium/core/theme/app_text_styles.dart';
import 'package:shop_lite_premium/features/product/presentation/views/home_view.dart';

import '../../../../../core/shared_widgets/primary_button.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../../product/presentation/views/product_view.dart';
import '../../../domain/entities/user_entity.dart';
import '../../cubits/auth_cubit.dart';
import '../widgets/auth_actions_section.dart';
import '../widgets/auth_brand_header.dart';
import '../widgets/auth_footer.dart';
import '../widgets/auth_form_fields.dart';
import '../widgets/auth_text_header.dart';
import 'forgot_password_view.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    final localization = Localizations.of<AppLocalizations>(
      context,
      AppLocalizations,
    );
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthLoginSuccess) {
          final authCubit = context.read<AuthCubit>();
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => HomeView()),
            (route) => false,
          );
        } else if (state is AuthFailure) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.errorMessage)));
        } else if(state is AuthLoginWithGoogleSuccess){
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
                      title: localization!.welcome,
                      subTitle: localization.welcomeSubTitle,
                    ),
                    SizedBox(height: 30),
                    AuthFormFields(
                      isLogin: true,
                      onEmailSaved: (value) {
                        email = value!;
                      },
                      onPasswordSaved: (value) {
                        password = value!;
                      },
                    ),
                    SizedBox(height: 16),
                    TextButton(
                      onPressed: () {
                        final authCubit = context.read<AuthCubit>();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BlocProvider.value(
                              value: authCubit,
                              child: ForgotPasswordView(),
                            ),
                          ),
                        );
                      },
                      child: Text(
                        localization.forgotPassword,
                        style: AppTextStyles.link(context),
                      ),
                    ),
                    SizedBox(height: 24),
                    BlocBuilder<AuthCubit, AuthState>(
                      builder: (context, state) {
                        return PrimaryButton(
                          isLoading: state is AuthLoading,
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              formKey.currentState!.save();
                              context.read<AuthCubit>().login(
                                userEntity: UserEntity(
                                  email: email,
                                  password: password,
                                ),
                              );
                            }
                          },
                          text: localization.login,
                        );
                      },
                    ),
                    SizedBox(height: 28),
                    AuthActionsSection(),
                    SizedBox(height: 100),
                    AuthFooter(isLogin: true),
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
