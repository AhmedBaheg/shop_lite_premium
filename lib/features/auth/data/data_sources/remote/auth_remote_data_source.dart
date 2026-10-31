import 'package:firebase_auth/firebase_auth.dart';
import 'package:shop_lite_premium/features/auth/data/models/auth_model.dart';

abstract class AuthRemoteDataSource {
  Future<void> login({required UserModel userModel});
  Future<void> createAccount({required UserModel userModel});
  Future<void> forgotPassword({required String email});
  Future<void> logout();
  Future<void> signInWithGoogle();
  Future<UserModel> getUserData();
}