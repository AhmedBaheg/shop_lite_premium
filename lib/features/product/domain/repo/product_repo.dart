import 'package:shop_lite_premium/core/network/result.dart';

import '../entities/product_entity.dart';

abstract class ProductRepo {

  Future<Result<List<ProductEntity>>> getProducts();

}