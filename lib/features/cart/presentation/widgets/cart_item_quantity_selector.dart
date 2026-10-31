import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_lite_premium/core/theme/app_colors.dart';

import '../cubits/cart_cubit.dart';

class CartItemQuantitySelector extends StatelessWidget {
  const CartItemQuantitySelector({
    super.key, required this.quantity, required this.productId,
  });

  final int quantity, productId;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: BoxBorder.all(
          color: AppColors.borderDefaultLight,
          width: 1,
        ),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              context.read<CartCubit>().changeCartQuantity(
                productId: productId,
                change: 1,
              );
            },
            icon: Icon(Icons.add_rounded),
            padding: EdgeInsets.zero,
          ),
          Text(quantity.toString()),
          IconButton(
            onPressed: () {
              context.read<CartCubit>().changeCartQuantity(
                productId: productId,
                change: -1,
              );
            },
            icon: Icon(Icons.remove_rounded),
            padding: EdgeInsets.zero,
          ),
        ],
      ),
    );
  }
}
