import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_lite_premium/features/wishlist/data/repo/fav_repo_impl.dart';

import '../../../wishlist/data/data_sources/locale/fav_local_data_source_impl.dart';
import '../../../wishlist/domain/use_cases/is_favorite_use_case.dart';
import '../../../wishlist/domain/use_cases/toggle_favorite_use_case.dart';
import '../../../wishlist/presentation/cubits/favorite/favorite_cubit.dart';
import '../../data/data_sources/remote/product_api_remote_data_source_impl.dart';
import '../../data/repo/product_repo_impl.dart';
import '../../domain/use_cases/get_product_use_case.dart';
import '../cubits/product/product_cubit.dart';
import 'explore_product_view.dart';

class ProductParentView extends StatelessWidget {
  const ProductParentView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductCubit(
            getProductUseCase: GetProductUseCase(
              productRepo: ProductRepoImpl(
                productApiRemoteDataSource: ProductApiRemoteDataSourceImpl(),
              ),
            ),
          )..fetchProducts(),
        ),
        BlocProvider(
          create: (context) => FavoriteCubit(
            toggleFavoriteUseCase: ToggleFavoriteUseCase(
              favRepo: FavRepoImpl(favLocalDataSource: FavLocalDataSourceImpl())
            ),
            isFavoriteUseCase: IsFavoriteUseCase(
              favRepo: FavRepoImpl(
                favLocalDataSource: FavLocalDataSourceImpl(),
              ),
            ),
          ),
        ),
      ],
      child: ExploreProductView(),
    );
  }
}
