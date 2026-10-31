import 'dart:developer';
import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:shop_lite_premium/core/network/result.dart';
import 'package:shop_lite_premium/features/auth/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:shop_lite_premium/features/auth/data/models/auth_model.dart';
import 'package:shop_lite_premium/features/auth/domain/entities/user_entity.dart';
import 'package:shop_lite_premium/features/auth/domain/repo/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource _authRemoteDataSource;

  new({required this._authRemoteDataSource});

  @override
  Future<Result<void>> createAccount({required UserEntity userEntity}) async {
    try {
      await _authRemoteDataSource.createAccount(
        userModel: UserModel.fromEntity(userEntity),
      );
      return Success(data: null);
    } catch (e) {
      log(e.toString());
      return Failure(errorMessage: e.toString());
    }
  }

  @override
  Future<Result<void>> forgotPassword({required String email}) async {
    try {
      await _authRemoteDataSource.forgotPassword(email: email);
      return Success(data: null);
    } catch (e) {
      log(e.toString());
      return Failure(errorMessage: e.toString());
    }
  }

  @override
  Future<Result<void>> login({required UserEntity userEntity}) async {
    try {
      await _authRemoteDataSource.login(
        userModel: UserModel.fromEntity(userEntity),
      );
      return Success(data: null);
    } catch (e) {
      return Failure(errorMessage: e.toString());
    }
  }

  @override
  Future<Result<void>> logout() async {
    try{
      await _authRemoteDataSource.logout();
      return Success(data: null);
    } catch(e){
      return Failure(errorMessage: e.toString());
    }
  }

  @override
  Future<Result<void>> signInWithGoogle() async{
    try{
      await _authRemoteDataSource.signInWithGoogle();
      return Success(data: null);
    } catch(e){
      return Failure(errorMessage: e.toString());
    }
  }

  @override
  Future<Result<UserEntity>> getUserData() async {
    try{
      final userModel = await _authRemoteDataSource.getUserData();
      return Success(data: userModel.toEntity());
    } catch(e){
      return Failure(errorMessage: e.toString());
    }
  }
}
