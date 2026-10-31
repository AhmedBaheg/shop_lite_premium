import 'package:flutter/material.dart';

import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/utils/app_spacing.dart';
import '../../views/product_details_view.dart';

class ProductInfoSection extends StatelessWidget {
  const new({
    super.key,
    required this.widget,
  });

  final ProductDetailsView widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.productEntity.title ?? "",
          style: AppTextStyles.headlineLarge(context),
        ),
        SizedBox(height: AppSpacing.x8),
        Text(
          "\$${widget.productEntity.price}",
          style: AppTextStyles.priceLarge(context),
        ),
        SizedBox(height: AppSpacing.x8),
        Text(
          widget.productEntity.description ?? "",
          style: AppTextStyles.bodyMedium(context),
        ),
      ],
    );
  }
}
