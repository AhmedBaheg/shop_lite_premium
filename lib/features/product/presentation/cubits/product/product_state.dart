part of 'product_cubit.dart';

@immutable
sealed class ProductState {}

final class ProductInitial extends ProductState {}
final class ProductLoading extends ProductState {}
final class ProductSuccess extends ProductState {
  final List<ProductEntity> allProducts, filteredProducts;

  new({required this.allProducts, required this.filteredProducts});
}
final class ProductFailure extends ProductState {
  final String errorMessage;

  new({required this.errorMessage});
}
