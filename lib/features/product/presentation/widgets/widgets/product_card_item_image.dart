import 'package:flutter/material.dart';
import 'package:shop_lite_premium/core/theme/app_colors.dart';
import 'package:shop_lite_premium/features/product/domain/entities/product_entity.dart';

class ProductCardItemImage extends StatelessWidget {
  const ProductCardItemImage({
    super.key,
    required this.image,
    this.height,
    this.color,
  });

  final String image;
  final double? height;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    const borderRadius = BorderRadius.all(Radius.circular(12));

    return Container(
      width: double.infinity,
      height: height ?? 165,
      decoration: BoxDecoration(
        color: color ?? AppColors.productBackgroundLight,
        borderRadius: borderRadius,
      ),
      clipBehavior: Clip.antiAlias,
      child: Image.network(
        image,
        fit: BoxFit.contain,
        loadingBuilder: (context, child, progress) {
          if (progress == null) return child;

          return const Center(
            child: SizedBox(
              width: 22,
              height: 22,
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
          );
        },
        errorBuilder: (context, error, stackTrace) {
          return Center(
            child: Icon(
              Icons.image_not_supported_outlined,
              color: Colors.grey.shade400,
              size: 30,
            ),
          );
        },
      ),
    );
  }
}
