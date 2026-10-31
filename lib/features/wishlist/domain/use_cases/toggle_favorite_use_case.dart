import '../../../../core/network/result.dart';
import '../../../product/domain/entities/product_entity.dart';
import '../repo/fav_repo.dart';

class ToggleFavoriteUseCase {

  final FavRepo _favRepo;

  ToggleFavoriteUseCase({required this._favRepo});

  Future<Result<void>> call(ProductEntity productEntity) async {
    return await _favRepo.toggleFavorite(productEntity);
  }

}