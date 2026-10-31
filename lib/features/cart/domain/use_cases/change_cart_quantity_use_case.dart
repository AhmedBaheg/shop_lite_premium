import '../../../../core/network/result.dart';
import '../repo/cart_repo.dart';

class ChangeCartQuantityUseCase {

  final CartRepo _cartRepo;

  ChangeCartQuantityUseCase({required this._cartRepo});

  Future<Result<void>> call({
    required int productId,
    required int change,
  }){
    return _cartRepo.changeCartQuantity(productId: productId, change: change);
  }

}