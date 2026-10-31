import 'package:firebase_auth/firebase_auth.dart';
import 'package:shop_lite_premium/core/network/result.dart';
import 'package:shop_lite_premium/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepo {
  Future<Result<void>> login({required UserEntity userEntity});
  Future<Result<void>> createAccount({required UserEntity userEntity});
  Future<Result<void>> forgotPassword({required String email});
  Future<Result<void>> logout();
  Future<Result<void>> signInWithGoogle();
  Future<Result<UserEntity>> getUserData();
}