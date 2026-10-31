import 'package:dio/dio.dart';
import 'package:shop_lite_premium/features/product/data/models/product_model.dart';

import 'product_api_remote_data_source.dart';

class ProductApiRemoteDataSourceImpl implements ProductApiRemoteDataSource {
  final Dio _dio = Dio();
  final List<ProductModel> products = [];

  @override
  Future<List<ProductModel>> getProducts() async {
    final response = await _dio.get('https://dummyjson.com/products');

    for (var product in response.data['products']) {
      products.add(ProductModel.fromJson(product));
    }
    return products;
  }
}
