import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_lite_premium/features/auth/domain/use_cases/sign_in_with_google_use_case.dart';
import 'package:shop_lite_premium/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:shop_lite_premium/features/auth/presentation/views/views/login_view.dart';

import '../../../data/data_sources/remote/auth_remote_data_source_impl.dart';
import '../../../data/repo/auth_repo_impl.dart';
import '../../../domain/use_cases/create_account_use_case.dart';
import '../../../domain/use_cases/forgot_password_use_case.dart';
import '../../../domain/use_cases/login_use_case.dart';
import '../../../domain/use_cases/logout_use_case.dart';

class AuthParent extends StatelessWidget {
  const AuthParent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(
        loginUseCase: LoginUseCase(
          authRepo: AuthRepoImpl(
            authRemoteDataSource: AuthRemoteDataSourceImpl(),
          ),
        ),
        createAccountUseCase: CreateAccountUseCase(
          authRepo: AuthRepoImpl(
            authRemoteDataSource: AuthRemoteDataSourceImpl(),
          ),
        ),
        forgotPasswordUseCase: ForgotPasswordUseCase(
          authRepo: AuthRepoImpl(
            authRemoteDataSource: AuthRemoteDataSourceImpl(),
          ),
        ),
        signInWithGoogleUseCase: SignInWithGoogleUseCase(
          authRepo: AuthRepoImpl(
            authRemoteDataSource: AuthRemoteDataSourceImpl(),
          ),
        ),
      ),
      child: Scaffold(body: LoginView()),
    );
  }
}
