import 'package:shop_lite_premium/core/network/result.dart';
import 'package:shop_lite_premium/features/product/domain/entities/product_entity.dart';
import 'package:shop_lite_premium/features/product/domain/repo/product_repo.dart';

import '../data_sources/remote/product_api_remote_data_source.dart';

class ProductRepoImpl implements ProductRepo{

  final ProductApiRemoteDataSource _productApiRemoteDataSource;

  new({required this._productApiRemoteDataSource});

  @override
  Future<Result<List<ProductEntity>>> getProducts() async {
    try{
      final products = await _productApiRemoteDataSource.getProducts();

      final entities = products.map((e) => e.toEntity()).toList();

      return Success(data: entities);
    } catch(e){
      return Failure(errorMessage: e.toString());
    }
  }
}