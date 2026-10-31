import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/app_spacing.dart';
import '../../domain/entities/cart_entity.dart';
import 'cart_item_quantity_selector.dart';

class CartItemDetails extends StatelessWidget {
  const CartItemDetails({super.key, required this.cartEntity});

  final CartEntity? cartEntity;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          cartEntity!.productEntity!.title ?? "No title",
          style: AppTextStyles.titleLarge(context),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: AppSpacing.x7),
        Text(
          cartEntity!.productEntity!.category ?? "No category",
          style: AppTextStyles.titleSmall(context)
              .copyWith(color: AppColors.textSecondaryLight),
        ),
        Row(
          children: [
            Expanded(
              child: Text(
                "\$${cartEntity!.productEntity!.price}",
                style: AppTextStyles.priceMedium(context),
              ),
            ),
            CartItemQuantitySelector(
              quantity: cartEntity!.quantity,
              productId: cartEntity!.productEntity!.id!,
            ),
          ],
        ),
      ],
    );
  }
}
