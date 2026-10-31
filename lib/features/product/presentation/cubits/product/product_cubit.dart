import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shop_lite_premium/core/network/result.dart';

import '../../../domain/entities/product_entity.dart';
import '../../../domain/use_cases/get_product_use_case.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit({this._getProductUseCase}) : super(ProductInitial());

  final GetProductUseCase? _getProductUseCase;

  List<ProductEntity> allProducts = [];
  List<ProductEntity> filteredProducts = [];

  Future<void> fetchProducts() async {
    emit(ProductLoading());

    final result = await _getProductUseCase?.call();

    if (result is Success<List<ProductEntity>>) {
      allProducts = result.data;
      filteredProducts = allProducts;

      emit(
        ProductSuccess(
          allProducts: allProducts,
          filteredProducts: filteredProducts,
        ),
      );
    } else if (result is Failure<List<ProductEntity>>) {
      emit(ProductFailure(errorMessage: result.errorMessage));
    }
  }

  void searchProducts(String query) {
    emit(ProductLoading());

    if (query.trim().isEmpty) {
      filteredProducts = allProducts;
    } else {
      filteredProducts = allProducts
          .where(
            (product) => product.title!.toLowerCase().contains(
              query.trim().toLowerCase(),
            ),
          )
          .toList();
    }
    emit(
      ProductSuccess(
        filteredProducts: filteredProducts,
        allProducts: allProducts,
      ),
    );
  }
}
