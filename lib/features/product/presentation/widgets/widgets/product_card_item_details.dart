import 'package:flutter/material.dart';

import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/utils/app_spacing.dart';
import '../../../domain/entities/product_entity.dart';

class ProductCardItemDetails extends StatelessWidget {
  const ProductCardItemDetails({
    super.key,
    required this.productEntity,
  });

  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: AppSpacing.x7),

        Text(
          productEntity.title ?? '',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyles.titleMedium(context).copyWith(
            color: const Color(0xFF1E293B),
            fontWeight: FontWeight.w600,
          ),
        ),

        SizedBox(height: AppSpacing.x4),

        Row(
          children: [
            Expanded(
              child: Text(
                '\$${(productEntity.price ?? 0).toStringAsFixed(2)}',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.priceMedium(context).copyWith(
                  color: const Color(0xFF111827),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const Icon(
              Icons.star_border_rounded,
              size: 16,
            ),
            SizedBox(width: AppSpacing.x4),
            Text(
                (productEntity.rating ?? 0).toStringAsFixed(2),
                style: AppTextStyles.bodySmall(context)
            ),
          ],
        ),
      ],
    );
  }
}

