import 'package:shop_lite_premium/core/network/result.dart';

import '../repo/auth_repo.dart';

class LogoutUseCase {

  final AuthRepo _authRepo;

  LogoutUseCase({required this._authRepo});

  Future<Result<void>> call(){
    return _authRepo.logout();
  }

}