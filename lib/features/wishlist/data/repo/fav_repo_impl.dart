import 'package:shop_lite_premium/core/network/result.dart';
import 'package:shop_lite_premium/features/product/domain/entities/product_entity.dart';

import '../../../product/data/models/product_model.dart';
import '../../domain/repo/fav_repo.dart';
import '../data_sources/locale/fav_local_data_source.dart';

class FavRepoImpl implements FavRepo {
  final FavLocalDataSource _favLocalDataSource;

  new({required this._favLocalDataSource});

  @override
  Future<Result<List<ProductEntity>>> getFavorites() async {
    try {
      final favList = await _favLocalDataSource.getFavorites();
      return Success(data: favList.map((e) => e.toEntity()).toList());
    } catch (e) {
      return Failure(errorMessage: e.toString());
    }
  }

  @override
  Future<Result<void>> toggleFavorite(ProductEntity productEntity) async {
    try {
      final productModel = ProductModel.fromEntity(productEntity);
      await _favLocalDataSource.toggleFavorite(productModel);
      return Success(data: null);
    } catch (e) {
      return Failure(errorMessage: e.toString());
    }
  }

  @override
  bool isFavorite({required int productId}) {
    return _favLocalDataSource.isFavorite(productId);
  }


}
