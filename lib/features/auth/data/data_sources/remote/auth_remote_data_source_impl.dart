import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart' hide Constant;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:shop_lite_premium/core/utils/constant.dart';
import 'package:shop_lite_premium/features/auth/data/data_sources/remote/auth_remote_data_source.dart';

import '../../models/auth_model.dart' show UserModel;

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  @override
  Future<void> createAccount({required UserModel userModel}) async {
    log('Email length: ${userModel.email?.length}');
    log('Password length: ${userModel.password?.length}');
    final credentials = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
          email: userModel.email!,
          password: userModel.password!,
        );

    final uid = credentials.user!.uid;
    await Hive.box<String>(Constant.uidBox).put(Constant.uidBox, uid);
    await FirebaseFirestore.instance
        .collection("users")
        .doc(uid)
        .set(userModel.toMap());
  }

  @override
  Future<void> forgotPassword({required String email}) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }

  @override
  Future<void> login({required UserModel userModel}) async {
    final credentials = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: userModel.email!,
      password: userModel.password!,
    );

    await Hive.box<String>(Constant.uidBox).clear();
    final uid = credentials.user!.uid;
    await Hive.box<String>(Constant.uidBox).put(Constant.uidBox, uid);
  }

  @override
  Future<void> logout() async {
    await Hive.box<String>(Constant.uidBox).clear();
    await FirebaseAuth.instance.signOut();
  }

  @override
  Future<void> signInWithGoogle() async {
    final googleSignIn = GoogleSignIn.instance;

    await googleSignIn.initialize();

    final googleUser = await googleSignIn.authenticate();

    final googleAuth = googleUser.authentication;

    final authCredential = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
    );

    final userCredential = await FirebaseAuth.instance.signInWithCredential(
      authCredential,
    );

    final uid = userCredential.user!.uid;

    await Hive.box<String>(Constant.uidBox).put(Constant.uidBox, uid);

    final userModel = UserModel(
      name: userCredential.user?.displayName,
      email: userCredential.user?.email, password:"",
    );

    await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .set(
      userModel.toMap(),
      SetOptions(merge: true),
    );

  }

  @override
  Future<UserModel> getUserData() async {
    final uid = Hive.box<String>(Constant.uidBox).get(Constant.uidBox);

    final userModel = await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .get();
    return UserModel.fromMap(userModel.data()!);
  }
}
