import '../../../product/domain/entities/product_entity.dart';

class CartEntity {
  final ProductEntity? productEntity;
  final int quantity;

  CartEntity({required this.productEntity, this.quantity = 1});

  double get subTotalPrice => productEntity!.price! * quantity;

  double get tax => subTotalPrice * 0.08;
}