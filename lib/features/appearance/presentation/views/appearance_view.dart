import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_lite_premium/core/shared_widgets/app_main_bar.dart';

import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/app_spacing.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../l10n/app_localizations.dart';
import '../widgets/appearance_option_tile.dart';

class AppearanceView extends StatefulWidget {
  const AppearanceView({super.key});

  @override
  State<AppearanceView> createState() => _AppearanceViewState();
}

class _AppearanceViewState extends State<AppearanceView> {

  String selectedAppearance = "light";

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppMainBar(
        title: localization.profileAppearance,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset(AppStrings.backIcon),
        ),
      ),
      body: Padding(padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: AppSpacing.x24),
            Text(
              localization.settingsAppearanceDescription,
              style: AppTextStyles.bodyLarge(context),
            ),
            SizedBox(height: AppSpacing.x24),
            AppearanceOptionTile(
              onTap: () {
                setState(() {
                  selectedAppearance = "light";
                });
              },
              localization: localization,
              appearance: "light",
              isSelected: selectedAppearance == "light",
            ),
            SizedBox(height: AppSpacing.x24),
            AppearanceOptionTile(
              onTap: () {
                setState(() {
                  selectedAppearance = "dark";
                });
              },
              localization: localization,
              appearance: "dark",
              isSelected: selectedAppearance == "dark",
            ),
          ],
        ),
      ),
    );
  }
}
