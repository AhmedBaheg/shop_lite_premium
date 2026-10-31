import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shop_lite_premium/core/network/result.dart';

import '../../domain/entities/cart_entity.dart';
import '../../domain/use_cases/add_to_cart_use_case.dart';
import '../../domain/use_cases/change_cart_quantity_use_case.dart';
import '../../domain/use_cases/delete_cart_item_use_case.dart';
import '../../domain/use_cases/get_cart_items_use_case.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit({this._addToCartUseCase, this._getCartItemsUseCase, this._changeCartQuantityUseCase, this._deleteCartItemUseCase})
    : super(CartInitial());

  final AddToCartUseCase? _addToCartUseCase;
  final GetCartItemsUseCase? _getCartItemsUseCase;
  final ChangeCartQuantityUseCase? _changeCartQuantityUseCase;
  final DeleteCartItemUseCase? _deleteCartItemUseCase;

  Future<void> fetchCartItems() async {
    emit(CartLoading());

    final result = await _getCartItemsUseCase?.call();

    if(result is Success<List<CartEntity>>){
      emit(CartSuccess(cartItemsList: result.data));
    }else if(result is Failure<List<CartEntity>>){
      emit(CartFailure(errorMessage: result.errorMessage));
    }

  }

  Future<void> addToCart({required CartEntity cartEntity}) async {
    emit(CartLoading());

    final result = await _addToCartUseCase?.call(cartEntity: cartEntity);

    if(result is Success<void>){
      emit(AddToCartSuccess());
    }else if(result is Failure<void>){
      emit(CartFailure(errorMessage: result.errorMessage));
    }
  }

  Future<void> changeCartQuantity({required int productId, required int change,}) async {
    final result = await _changeCartQuantityUseCase?.call(
      productId: productId,
      change: change,
    );
    if(result is Success<void>){
      fetchCartItems();
    }else if(result is Failure<void>){
      emit(CartFailure(errorMessage: result.errorMessage));
    }
  }

  Future<void> deleteCartItem({required String productId}) async {

    final result = await _deleteCartItemUseCase?.call(productId: productId);
    if(result is Success<void>){
      fetchCartItems();
    }else if(result is Failure<void>){
      emit(CartFailure(errorMessage: result.errorMessage));
    }
  }

}
