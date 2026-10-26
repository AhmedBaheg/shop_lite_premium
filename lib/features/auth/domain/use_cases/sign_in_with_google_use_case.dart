import 'package:firebase_auth/firebase_auth.dart';
import 'package:shop_lite_premium/features/auth/domain/repo/auth_repo.dart';

import '../../../../core/network/result.dart';

class SignInWithGoogleUseCase {
  final AuthRepo _authRepo;

  SignInWithGoogleUseCase({required this._authRepo});

  Future<Result<void>> call() async {
    return await _authRepo.signInWithGoogle();
  }
}
