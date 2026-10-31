import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/utils/app_spacing.dart';
import '../../views/product_details_view.dart';

class ProductDetailsMeta extends StatelessWidget {
  const ProductDetailsMeta({
    super.key,
    required this.widget,
  });

  final ProductDetailsView widget;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            widget.productEntity.category ?? "",
            style: AppTextStyles.labelMedium(context)
                .copyWith(fontWeight: FontWeight.w400),
          ),
        ),
        Row(
          children: [
            Icon(
              Icons.star_outline_rounded,
              color: AppColors.actionPrimaryLight,
            ),
            SizedBox(width: AppSpacing.x4),
            Text(
              widget.productEntity.rating?.toString() ?? "",
              style: AppTextStyles.labelMedium(context),
            ),
            SizedBox(width: AppSpacing.x4),
            Text(
              "(${widget.productEntity.reviews} reviews)",
              style: AppTextStyles.labelMedium(context),
            ),
          ],
        ),
      ],
    );
  }
}
