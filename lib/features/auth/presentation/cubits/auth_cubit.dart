import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:shop_lite_premium/core/network/result.dart';
import 'package:shop_lite_premium/features/auth/domain/use_cases/sign_in_with_google_use_case.dart';

import '../../domain/entities/user_entity.dart';
import '../../domain/use_cases/create_account_use_case.dart';
import '../../domain/use_cases/forgot_password_use_case.dart';
import '../../domain/use_cases/login_use_case.dart';
import '../../domain/use_cases/logout_use_case.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({
    this._loginUseCase,
    this._createAccountUseCase,
    this._forgotPasswordUseCase,
    this._logoutUseCase,
    this._signInWithGoogleUseCase,
  }) : super(AuthInitial());

  final LoginUseCase? _loginUseCase;
  final CreateAccountUseCase? _createAccountUseCase;
  final ForgotPasswordUseCase? _forgotPasswordUseCase;
  final LogoutUseCase? _logoutUseCase;
  final SignInWithGoogleUseCase? _signInWithGoogleUseCase;

  Future<void> login({required UserEntity userEntity}) async {
    emit(AuthLoading());

    final result = await _loginUseCase?.call(userEntity: userEntity);

    if (result is Success) {
      emit(AuthLoginSuccess());
    } else if (result is Failure) {
      emit(AuthFailure(errorMessage: result.errorMessage));
    }
  }

  Future<void> createAccount({required UserEntity userEntity}) async {
    emit(AuthLoading());

    final result = await _createAccountUseCase?.call(userEntity: userEntity);

    if (result is Success) {
      emit(AuthCreateAccountSuccess());
    } else if (result is Failure) {
      emit(AuthFailure(errorMessage: result.errorMessage));
    }
  }

  Future<void> forgotPassword({required String email}) async {
    emit(AuthLoading());

    final result = await _forgotPasswordUseCase?.call(email: email);

    if (result is Success) {
      emit(AuthForgotPasswordSuccess());
    } else if (result is Failure) {
      emit(AuthFailure(errorMessage: result.errorMessage));
    }
  }

  Future<void> logout() async {
    emit(AuthLoading());
    final result = await _logoutUseCase?.call();
    if (result is Success) {
      emit(AuthLogoutSuccess());
    } else if (result is Failure) {
      emit(AuthFailure(errorMessage: result.errorMessage));
    }
  }

  Future<void> signInWithGoogle() async {
    emit(AuthLoginWithGoogleLoading());

    final result = await _signInWithGoogleUseCase?.call();

    if (result is Success) {
      emit(AuthLoginWithGoogleSuccess());
    } else if (result is Failure) {
      emit(AuthFailure(errorMessage: result.errorMessage));
    }
  }
}
