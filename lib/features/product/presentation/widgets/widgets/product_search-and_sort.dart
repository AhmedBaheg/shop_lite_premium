import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_lite_premium/features/product/presentation/cubits/product/product_cubit.dart';

import '../../../../../core/shared_widgets/app_text_form_field.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../l10n/app_localizations.dart';

class ProductSearchAndSort extends StatelessWidget {
  const ProductSearchAndSort({super.key, required this.localization, required this.productNumber});

  final AppLocalizations? localization;
  final int productNumber;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10),
        AppTextFormField(
          prefixIcon: AppStrings.searchIcon,
          hintText: localization!.search,
          onChanged: (value) {
            context.read<ProductCubit>().searchProducts(value);
          },
        ),
        SizedBox(height: 17),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "$productNumber ${localization!.products}",
              style: AppTextStyles.bodySmall(
                context,
                color: AppColors.textSecondaryLight,
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(AppStrings.sortIcon, width: 17, height: 17),
                  SizedBox(width: 8),
                  Text(
                    localization!.sort,
                    style: AppTextStyles.bodySmall(
                      context,
                      color: AppColors.textSecondaryLight,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
