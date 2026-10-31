import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/app_spacing.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../product/domain/entities/product_entity.dart';
import '../../../product/presentation/widgets/widgets/product_card_item_image.dart';
import '../../domain/entities/cart_entity.dart';
import '../cubits/cart_cubit.dart';
import 'cart_item_details.dart';

class CartItemCard extends StatelessWidget {
  const CartItemCard({super.key, required this.cartEntity});

  final CartEntity? cartEntity;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            width: 110,
            child: ProductCardItemImage(
              height: 100,
              image: cartEntity!.productEntity!.image ?? "",
            ),
          ),
          SizedBox(width: AppSpacing.x14),
          Expanded(child: CartItemDetails(cartEntity: cartEntity)),
          IconButton(
            onPressed: () {
              context.read<CartCubit>().deleteCartItem(
                productId: cartEntity!.productEntity!.id.toString(),
              );
            },
            icon: SvgPicture.asset(AppStrings.deleteIcon),
            padding: EdgeInsets.zero,
          ),
        ],
      ),
    );
  }
}
