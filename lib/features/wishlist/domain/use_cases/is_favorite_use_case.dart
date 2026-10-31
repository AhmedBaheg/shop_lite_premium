
import '../../../../core/network/result.dart';
import '../repo/fav_repo.dart';

class IsFavoriteUseCase {
  final FavRepo _favRepo;

  IsFavoriteUseCase({required this._favRepo});

  bool call(int productId)  {
    return  _favRepo.isFavorite(productId: productId);
  }
}
