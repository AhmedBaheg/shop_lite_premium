import 'package:shop_lite_premium/features/product/data/models/product_model.dart';

import '../../domain/entities/cart_entity.dart';

class CartModel {
  final ProductModel? productModel;
  final int quantity;

  CartModel({required this.productModel, this.quantity = 1});

  double get totalPrice => productModel!.price! * quantity;

  double get tax => totalPrice * 0.08;

  factory CartModel.fromEntity(CartEntity cartEntity) {
    return CartModel(
      productModel: ProductModel.fromEntity(cartEntity.productEntity!),
      quantity: cartEntity.quantity,
    );
  }

  CartEntity toEntity() {
    return CartEntity(
      productEntity: productModel!.toEntity(),
      quantity: quantity,
    );
  }

  Map<String, dynamic> toJson() {
    return {'productModel': productModel!.toJson(), 'quantity': quantity};
  }

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      productModel: ProductModel.fromJson(json['productModel']),
      quantity: json['quantity'] ?? 1,
    );
  }
}
