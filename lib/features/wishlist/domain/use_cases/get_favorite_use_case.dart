import '../../../../core/network/result.dart';
import '../../../product/domain/entities/product_entity.dart';
import '../repo/fav_repo.dart';

class GetFavoriteUseCase {

  final FavRepo _favRepo;

  GetFavoriteUseCase({required this._favRepo});

  Future<Result<List<ProductEntity>>> call() async {
    return await _favRepo.getFavorites();
  }

}