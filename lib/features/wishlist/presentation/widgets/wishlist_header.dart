import 'package:flutter/material.dart';
import 'package:shop_lite_premium/l10n/app_localizations.dart';

import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/app_spacing.dart';

class WishlistHeader extends StatelessWidget {
  const WishlistHeader({
    super.key,
    required this.localization, required this.favNumber,
  });

  final AppLocalizations? localization;
  final int favNumber;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: AppSpacing.x10),
        Text(
          "$favNumber ${localization!.savedFav}",
          style: AppTextStyles.titleSmall(context).copyWith(),
        ),
        SizedBox(height: AppSpacing.x4),
        Text(
          localization!.savedFavSubTitle,
          style: AppTextStyles.bodySmall(context),
        ),
      ],
    );
  }
}
