import 'package:shop_lite_premium/features/product/domain/repo/product_repo.dart';

import '../../../../core/network/result.dart';
import '../entities/product_entity.dart';

class GetProductUseCase {

  final ProductRepo _productRepo;

  GetProductUseCase({required this._productRepo});

  Future<Result<List<ProductEntity>>> call() async{
    return await _productRepo.getProducts();
  }

}