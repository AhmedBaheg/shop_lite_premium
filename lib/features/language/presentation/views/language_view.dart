import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_lite_premium/core/shared_widgets/app_main_bar.dart';
import 'package:shop_lite_premium/core/theme/app_text_styles.dart';
import 'package:shop_lite_premium/features/language/presentation/cubits/language_cubit.dart';

import '../../../../core/utils/app_spacing.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../l10n/app_localizations.dart';
import '../widgets/language_option_tile.dart';

class LanguageView extends StatelessWidget {
  const LanguageView({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppMainBar(
        title: localization.languageTitle,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset(AppStrings.backIcon),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            SizedBox(height: AppSpacing.x24),
            Text(
              localization.settingsLanguageDescription,
              style: AppTextStyles.bodyLarge(context),
            ),
            SizedBox(height: AppSpacing.x24),
            BlocBuilder<LanguageCubit, LanguageState>(
              builder: (context, state) {
                final selectedLanguage = state is LanguageChanged
                    ? state.locale.languageCode
                    : "en";
                return Column(
                  children: [
                    LanguageOptionTile(
                      onTap: () {
                        context.read<LanguageCubit>().changeLanguage("en");
                      },
                      localization: localization,
                      language: "en",
                      isSelected: selectedLanguage == "en",
                    ),
                    SizedBox(height: AppSpacing.x24),
                    LanguageOptionTile(
                      onTap: () {
                        context.read<LanguageCubit>().changeLanguage("ar");
                      },
                      localization: localization,
                      language: "ar",
                      isSelected: selectedLanguage == "ar",
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
