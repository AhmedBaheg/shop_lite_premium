import '../../models/cart_model.dart';

abstract class CartFirestoreRemoteDataSource {
  Future<void> addToCart({required CartModel cartModel});

  Future<List<CartModel>> getCartItems();

  Future<void> updateCart({
    required CartModel cartModel,
  });

  Future<void> deleteCartItems({required String productId});
}
