import 'package:shop_lite_premium/core/network/result.dart';

import '../repo/auth_repo.dart';

class ForgotPasswordUseCase {

  final AuthRepo _authRepo;

  ForgotPasswordUseCase({required this._authRepo});

  Future<Result<void>> call({required String email}){
    return _authRepo.forgotPassword(email: email);
  }

}