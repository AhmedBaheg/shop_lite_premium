part of 'favorite_cubit.dart';

@immutable
sealed class FavoriteState {}

final class FavoriteInitial extends FavoriteState {}

final class FavoriteLoading extends FavoriteState {}

final class FavoriteSuccess extends FavoriteState {
  final List<ProductEntity> productList;

  new({required this.productList});
}

final class FavoriteFailure extends FavoriteState {
  final String errorMessage;

  new({required this.errorMessage});
}
