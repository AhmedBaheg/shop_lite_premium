import 'package:shop_lite_premium/core/network/result.dart';

import '../entities/cart_entity.dart';

abstract class CartRepo {
  Future<Result<void>> addToCart({required CartEntity cartEntity});

  Future<Result<List<CartEntity>>> getCartItems();

  Future<Result<void>> updateCart({required CartEntity cartEntity});

  Future<Result<void>> changeCartQuantity({
    required int productId,
    required int change,
  });

  Future<Result<void>> deleteCartItems({required String productId});
}
