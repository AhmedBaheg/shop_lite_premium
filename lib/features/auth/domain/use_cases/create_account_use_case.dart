import 'package:shop_lite_premium/core/network/result.dart';

import '../entities/user_entity.dart';
import '../repo/auth_repo.dart';

class CreateAccountUseCase {

  final AuthRepo _authRepo;

  CreateAccountUseCase({required this._authRepo});

  Future<Result<void>> call({required UserEntity userEntity}){
    return _authRepo.createAccount(userEntity: userEntity);
  }

}