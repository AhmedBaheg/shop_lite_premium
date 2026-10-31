
import 'package:flutter/material.dart';
import 'package:shop_lite_premium/core/theme/app_text_styles.dart';

import '../../../../../core/theme/app_colors.dart';

class ProductColorSelector extends StatelessWidget {
  const ProductColorSelector({
    super.key,
    required this.selectedColor,
    required this.onColorSelected,
  });

  final Color selectedColor;
  final ValueChanged<Color> onColorSelected;

  static const colors = [
    AppColors.productBackgroundSand,
    AppColors.productBackgroundSlate,
    AppColors.productBackgroundLight,
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Color: ${_colorName(selectedColor)}', style: AppTextStyles.titleSmall(context),),
        const SizedBox(height: 12),
        Row(
          children: colors.map((color) {
            final selected = selectedColor == color;

            return GestureDetector(
              onTap: () => onColorSelected(color),
              child: Container(
                margin: const EdgeInsets.only(right: 12),
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: selected ? Colors.blue : Colors.grey.shade300,
                    width: selected ? 2.0 : 1.5,
                  ),
                ),
                child: CircleAvatar(
                  radius: 12,
                  backgroundColor: color,
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  String _colorName(Color color) {
    if (color == AppColors.productBackgroundSand) return 'Sand';
    if (color == AppColors.productBackgroundSlate) return 'Slate';
    if (color == AppColors.productBackgroundLight) return 'Light';
    return 'Custom';
  }
}
