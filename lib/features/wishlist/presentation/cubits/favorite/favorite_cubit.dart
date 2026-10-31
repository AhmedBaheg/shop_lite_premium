import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shop_lite_premium/core/network/result.dart';

import '../../../../product/domain/entities/product_entity.dart';
import '../../../domain/use_cases/get_favorite_use_case.dart';
import '../../../domain/use_cases/is_favorite_use_case.dart';
import '../../../domain/use_cases/toggle_favorite_use_case.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit({
    this._toggleFavoriteUseCase,
    required this._isFavoriteUseCase,
    this._getFavoriteUseCase,
  }) : super(FavoriteInitial());

  final ToggleFavoriteUseCase? _toggleFavoriteUseCase;
  final IsFavoriteUseCase _isFavoriteUseCase;
  final GetFavoriteUseCase? _getFavoriteUseCase;

  Future<void> toggleFavorite(ProductEntity productEntity) async {

    final result = await _toggleFavoriteUseCase?.call(productEntity);
    if (result is Success) {
      return await fetchFavorites();
    } else if (result is Failure) {
      return emit(FavoriteFailure(errorMessage: result.errorMessage));
    }
  }

  bool isFavorite(int productId) {
    return _isFavoriteUseCase.call(productId);
  }

  Future<void> fetchFavorites() async {
    emit(FavoriteLoading());

    final result = await _getFavoriteUseCase?.call();

    if(result is Success<List<ProductEntity>>){
      return emit(FavoriteSuccess(productList: result.data));
    } else if(result is Failure<List<ProductEntity>>){
      return emit(FavoriteFailure(errorMessage: result.errorMessage));
    }
  }
}
