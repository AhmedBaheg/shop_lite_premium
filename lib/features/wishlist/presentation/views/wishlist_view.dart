import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_lite_premium/core/utils/app_spacing.dart';
import 'package:shop_lite_premium/l10n/app_localizations.dart';

import '../../../../core/shared_widgets/app_loading_indicator.dart';
import '../../../../core/shared_widgets/app_main_bar.dart';
import '../../../product/presentation/widgets/widgets/product_card_item.dart';
import '../../../../core/shared_widgets/empty_state_widget.dart';
import '../../data/data_sources/locale/fav_local_data_source_impl.dart';
import '../../data/repo/fav_repo_impl.dart';
import '../../domain/use_cases/get_favorite_use_case.dart';
import '../../domain/use_cases/is_favorite_use_case.dart';
import '../../domain/use_cases/toggle_favorite_use_case.dart';
import '../cubits/favorite/favorite_cubit.dart';
import '../widgets/wishlist_header.dart';

class WishlistView extends StatelessWidget {
  const WishlistView({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = Localizations.of<AppLocalizations>(
      context,
      AppLocalizations,
    );
    return BlocProvider(
      create: (context) => FavoriteCubit(
        isFavoriteUseCase: IsFavoriteUseCase(
          favRepo: FavRepoImpl(favLocalDataSource: FavLocalDataSourceImpl()),
        ),
        getFavoriteUseCase: GetFavoriteUseCase(
          favRepo: FavRepoImpl(favLocalDataSource: FavLocalDataSourceImpl()),
        ),
        toggleFavoriteUseCase: ToggleFavoriteUseCase(
          favRepo: FavRepoImpl(favLocalDataSource: FavLocalDataSourceImpl()),
        ),
      )..fetchFavorites(),

      child: Scaffold(
        appBar: AppMainBar(title: localization!.wishlistTitle),
        body: BlocBuilder<FavoriteCubit, FavoriteState>(
          builder: (context, state) {
            if (state is FavoriteLoading) {
              return const Center(child: AppLoadingIndicator());
            } else if (state is FavoriteFailure) {
              return Center(child: Text(state.errorMessage));
            } else if (state is FavoriteSuccess) {
              final favList = state.productList;

              return favList.isEmpty
                  ? EmptyStateWidget(
                      icon: Icons.favorite_border_rounded,
                      title: 'Your wishlist is empty',
                      description: 'Add products you love to see them here.',
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        WishlistHeader(
                          localization: localization,
                          favNumber: favList.length,
                        ),

                        SizedBox(height: AppSpacing.x20),

                        Expanded(
                          child: GridView.builder(
                            itemCount: favList.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: AppSpacing.x14,
                                  mainAxisSpacing: AppSpacing.x14,
                                  childAspectRatio: 0.77,
                                ),
                            itemBuilder: (context, index) {
                              return ProductCardItem(
                                productEntity: favList[index],
                              );
                            },
                          ),
                        ),
                      ],
                    );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
