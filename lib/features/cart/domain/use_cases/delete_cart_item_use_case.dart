import '../../../../core/network/result.dart';
import '../repo/cart_repo.dart';

class DeleteCartItemUseCase {

  final CartRepo _cartRepo;

  DeleteCartItemUseCase({required this._cartRepo});

  Future<Result<void>> call({required String productId}) async {
    return await _cartRepo.deleteCartItems(productId: productId);
  }


}