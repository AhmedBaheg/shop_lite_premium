import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shop_lite_premium/features/cart/domain/entities/cart_entity.dart';
import 'package:shop_lite_premium/l10n/app_localizations.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/app_spacing.dart';
import 'cart_summary_row.dart';

class CartOrderSummary extends StatelessWidget {
  const CartOrderSummary({
    super.key,
    required this.localization,
    required this.cartItemsList,
  });

  final AppLocalizations localization;
  final List<CartEntity> cartItemsList;

  @override
  Widget build(BuildContext context) {
    final subTotal = cartItemsList.fold<double>(0, (sum, item) {
      return sum + item.subTotalPrice;
    });

    final tax = cartItemsList.fold<double>(0, (sum, item) {
      return sum + item.tax;
    });

    return Column(
      children: [
        CartSummaryRow(
          title:
              "${localization.subTotal} "
              "(${cartItemsList.length} ${localization.items})",
          value: '\S${subTotal.toStringAsFixed(2)}',
        ),
        SizedBox(height: AppSpacing.x18),

        CartSummaryRow(title: localization.delivery, value: 'Free'),
        SizedBox(height: AppSpacing.x18),

        CartSummaryRow(
          title: localization.tax,
          value: '\S${tax.toStringAsFixed(2)}',
        ),
        SizedBox(height: AppSpacing.x18),

        Divider(height: 1, color: AppColors.borderDefaultLight),
        SizedBox(height: AppSpacing.x18),

        CartSummaryRow(
          title: localization.total,
          value: '\S${(subTotal + tax).toStringAsFixed(2)}',
          isTotal: true,
        ),
      ],
    );
  }
}
