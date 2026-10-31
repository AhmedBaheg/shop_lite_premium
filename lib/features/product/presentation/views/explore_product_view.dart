import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_lite_premium/core/shared_widgets/app_loading_indicator.dart';
import 'package:shop_lite_premium/core/utils/app_spacing.dart';
import 'package:shop_lite_premium/features/product/presentation/views/product_details_view.dart';
import 'package:shop_lite_premium/l10n/app_localizations.dart';

import '../../../../core/shared_widgets/app_main_bar.dart';
import '../../../wishlist/presentation/cubits/favorite/favorite_cubit.dart';
import '../cubits/product/product_cubit.dart';
import '../widgets/widgets/product_card_item.dart';
import '../widgets/widgets/product_search-and_sort.dart';

class ExploreProductView extends StatelessWidget {
  const ExploreProductView({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = Localizations.of<AppLocalizations>(
      context,
      AppLocalizations,
    );
    return Scaffold(
      appBar: AppMainBar(title: localization!.exploreTitle),
      body: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          if (state is ProductLoading) {
            return const Center(child: AppLoadingIndicator());
          } else if (state is ProductFailure) {
            return Center(child: Text(state.errorMessage));
          } else if (state is ProductSuccess) {
            final productList = state.filteredProducts;
            return Column(
              children: [
                ProductSearchAndSort(
                  localization: localization,
                  productNumber: productList.length,
                ),

                SizedBox(height: AppSpacing.x17),

                Expanded(
                  child: GridView.builder(
                    itemCount: productList.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: AppSpacing.x14,
                      mainAxisSpacing: AppSpacing.x14,
                      childAspectRatio: 0.77,
                    ),
                    itemBuilder: (context, index) {
                      final productEntity = productList[index];

                      return Builder(
                        builder: (context) {
                          return GestureDetector(
                            onTap: () {
                              final productCubit = context.read<ProductCubit>();
                              final favoriteCubit = context.read<FavoriteCubit>();

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MultiBlocProvider(
                                    providers: [
                                      BlocProvider.value(value: productCubit),
                                      BlocProvider.value(value: favoriteCubit),
                                    ],
                                    child: ProductDetailsView(
                                      productEntity: productEntity,
                                    ),
                                  ),
                                ),
                              );
                            },
                            child: ProductCardItem(
                              productEntity: productEntity,
                            ),
                          );
                        },
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
    );
  }
}
