import '../../models/product_model.dart';

abstract class ProductApiRemoteDataSource {

  Future<List<ProductModel>> getProducts();

}
