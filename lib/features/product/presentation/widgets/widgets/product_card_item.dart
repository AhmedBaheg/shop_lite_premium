import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_lite_premium/core/theme/app_colors.dart';

import '../../../../wishlist/presentation/cubits/favorite/favorite_cubit.dart';
import '../../../domain/entities/product_entity.dart';
import 'product_card_item_details.dart';
import 'product_card_item_image.dart';

class ProductCardItem extends StatelessWidget {
  const ProductCardItem({super.key, required this.productEntity});

  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(16),
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ProductCardItemImage(image: productEntity.image ?? ""),

                Positioned(
                  top: 4,
                  right: 4,
                  child: Material(
                    color: AppColors.white,
                    shape: const CircleBorder(),
                    child: BlocBuilder<FavoriteCubit, FavoriteState>(
                      builder: (context, state) {
                        final favoriteCubit = context.read<FavoriteCubit>();
                        final isFavorite = favoriteCubit.isFavorite(
                          productEntity.id!,
                        );
                        return InkWell(
                          onTap: () {
                            favoriteCubit.toggleFavorite(productEntity);
                          },
                          customBorder: const CircleBorder(),
                          child: SizedBox(
                            width: 34,
                            height: 34,
                            child: isFavorite
                                ? const Icon(
                                    Icons.favorite_rounded,
                                    size: 21,
                                    color: Colors.red,
                                  )
                                : const Icon(
                                    Icons.favorite_border_rounded,
                                    size: 21,
                                    color: AppColors.actionPrimaryLight,
                                  ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),

            ProductCardItemDetails(productEntity: productEntity),
          ],
        ),
      ),
    );
  }
}
