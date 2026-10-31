import 'package:flutter/material.dart';
import 'package:shop_lite_premium/core/theme/app_colors.dart';
import 'package:shop_lite_premium/features/cart/domain/entities/cart_entity.dart';

import '../../../../core/utils/app_spacing.dart';
import '../../../product/domain/entities/product_entity.dart';
import 'cart_item_card.dart';

class ListViewBuilderWidget extends StatelessWidget {
  const ListViewBuilderWidget({super.key,required this.cartItemsList});

  final List<CartEntity> cartItemsList;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) =>
          CartItemCard(cartEntity: cartItemsList[index]),
      separatorBuilder: (context, index) {
        return Column(
          children: [
            SizedBox(height: AppSpacing.x20),
            Divider(height: 1, color: AppColors.borderDefaultLight),
            SizedBox(height: AppSpacing.x20),
          ],
        );
      },
      itemCount: cartItemsList.length,
    );
  }
}
