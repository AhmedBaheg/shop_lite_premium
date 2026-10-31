part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthLoginWithGoogleLoading extends AuthState {}

final class AuthLoginSuccess extends AuthState {}

final class AuthLoginWithGoogleSuccess extends AuthState {}

final class AuthCreateAccountSuccess extends AuthState {}

final class AuthForgotPasswordSuccess extends AuthState {}

final class AuthLogoutSuccess extends AuthState {}

final class AuthGetUserDataLoading extends AuthState {}

final class AuthGetUserDataSuccess extends AuthState {
  final UserEntity userEntity;

  new({required this.userEntity});
}

final class AuthFailure extends AuthState {
  final String errorMessage;

  new({required this.errorMessage});
}
