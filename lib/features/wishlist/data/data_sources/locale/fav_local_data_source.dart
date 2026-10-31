import 'package:shop_lite_premium/features/product/data/models/product_model.dart';

abstract class FavLocalDataSource {

  bool isFavorite(int productId);
  Future<void> toggleFavorite(ProductModel productModel);
  Future<List<ProductModel>> getFavorites();

}