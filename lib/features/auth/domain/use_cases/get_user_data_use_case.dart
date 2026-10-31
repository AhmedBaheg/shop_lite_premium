import 'package:shop_lite_premium/features/auth/domain/repo/auth_repo.dart';

import '../../../../core/network/result.dart';
import '../entities/user_entity.dart';

class GetUserDataUseCase {

  final AuthRepo _authRepo;

  GetUserDataUseCase(this._authRepo);

  Future<Result<UserEntity>> call() async {
    return await _authRepo.getUserData();
  }

}