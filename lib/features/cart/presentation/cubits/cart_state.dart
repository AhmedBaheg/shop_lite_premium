part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}
final class CartLoading extends CartState {}
final class AddToCartSuccess extends CartState {}
final class UpdateCartSuccess extends CartState {}
final class CartSuccess extends CartState {
  final List<CartEntity> cartItemsList;

  CartSuccess({required this.cartItemsList});
}
final class CartFailure extends CartState {
  final String errorMessage;

  new({required this.errorMessage});
}
