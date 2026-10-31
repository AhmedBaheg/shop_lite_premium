import 'package:shop_lite_premium/features/cart/domain/repo/cart_repo.dart';

import '../../../../core/network/result.dart';
import '../entities/cart_entity.dart';

class AddToCartUseCase {

  final CartRepo _cartRepo;

  AddToCartUseCase({required this._cartRepo});

  Future<Result<void>> call({required CartEntity cartEntity}) async {
    return await _cartRepo.addToCart(cartEntity: cartEntity);
  }
}