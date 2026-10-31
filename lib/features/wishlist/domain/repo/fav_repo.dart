import 'package:shop_lite_premium/core/network/result.dart';

import '../../../product/domain/entities/product_entity.dart';

abstract class FavRepo {

  bool isFavorite({required int productId});
  Future<Result<void>> toggleFavorite(ProductEntity productEntity);
  Future<Result<List<ProductEntity>>> getFavorites();

}