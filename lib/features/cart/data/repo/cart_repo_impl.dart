import 'dart:developer';

import 'package:shop_lite_premium/core/network/result.dart';
import 'package:shop_lite_premium/features/cart/domain/entities/cart_entity.dart';
import 'package:shop_lite_premium/features/cart/domain/repo/cart_repo.dart';

import '../data_sources/remote/cart_firestore_remote_data_source.dart';
import '../models/cart_model.dart';

class CartRepoImpl implements CartRepo {
  final CartFirestoreRemoteDataSource _cartFirestoreRemoteDataSource;

  CartRepoImpl({required this._cartFirestoreRemoteDataSource});

  @override
  Future<Result<void>> addToCart({required CartEntity cartEntity}) async {
    List<CartEntity> cartItemsList = [];
    try {
      final result = await getCartItems();

      if (result is Success<List<CartEntity>>) {
        cartItemsList = result.data;
      }

      final existingItem = cartItemsList.indexWhere(
        (element) => element.productEntity!.id == cartEntity.productEntity!.id,
      );

      if (existingItem != -1) {
        final updatedCartEntity = CartEntity(
          productEntity: cartItemsList[existingItem].productEntity,
          quantity: cartItemsList[existingItem].quantity + 1,
        );

        await updateCart(cartEntity: updatedCartEntity);
      } else {
        await _cartFirestoreRemoteDataSource.addToCart(
          cartModel: CartModel.fromEntity(cartEntity),
        );
      }

      return Success(data: null);
    } catch (e) {
      return Failure(errorMessage: e.toString());
    }
  }

  @override
  Future<Result<List<CartEntity>>> getCartItems() async {
    List<CartEntity> cartItemsList = [];
    try {
      final items = await _cartFirestoreRemoteDataSource.getCartItems();
      for (var item in items) {
        cartItemsList.add(item.toEntity());
      }
      return Success(data: cartItemsList);
    } catch (e) {
      return Failure(errorMessage: e.toString());
    }
  }

  @override
  Future<Result<void>> updateCart({required CartEntity cartEntity}) async {
    try {
      await _cartFirestoreRemoteDataSource.updateCart(
        cartModel: CartModel.fromEntity(cartEntity),
      );
      return Success(data: null);
    } catch (e) {
      return Failure(errorMessage: e.toString());
    }
  }

  @override
  Future<Result<void>> changeCartQuantity({
    required int productId,
    required int change,
  }) async {
    List<CartEntity> cartItemsList = [];

    try {
      final result = await getCartItems();

      if (result is Success<List<CartEntity>>) {
        cartItemsList = result.data;
      }

      final existingItem = cartItemsList.indexWhere(
        (element) => element.productEntity!.id == productId,
      );

      final newQuantity = cartItemsList[existingItem].quantity + change;

      if (newQuantity < 1) {
        return Success(data: null);
      }

      final updatedCartEntity = CartEntity(
        productEntity: cartItemsList[existingItem].productEntity,
        quantity: newQuantity,
      );
      await updateCart(cartEntity: updatedCartEntity);
      return Success(data: null);
    } catch (e) {
      return Failure(errorMessage: e.toString());
    }
  }

  @override
  Future<Result<void>> deleteCartItems({required String productId}) async {
    try {
      await _cartFirestoreRemoteDataSource.deleteCartItems(
        productId: productId,
      );
      return Success(data: null);
    } catch (e) {
      return Failure(errorMessage: e.toString());
    }
  }
}
