import 'package:shop_lite_premium/features/cart/domain/repo/cart_repo.dart';

import '../../../../core/network/result.dart';
import '../entities/cart_entity.dart';

class GetCartItemsUseCase {

  final CartRepo _cartRepo;

  new({required this._cartRepo});

  Future<Result<List<CartEntity>>> call() async {
    return await _cartRepo.getCartItems();
  }
}