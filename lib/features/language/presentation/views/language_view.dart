import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_lite_premium/core/shared_widgets/app_main_bar.dart';
import 'package:shop_lite_premium/core/utils/app_strings.dart';
import 'package:shop_lite_premium/l10n/app_localizations.dart';

import '../../../../core/localization/language_cubit.dart';
import '../../../../core/shared_widgets/selection_tile.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/app_spacing.dart';

class LanguageView extends StatelessWidget {
  const LanguageView({
    super.key,
    required this.locale,
    required this.onLocaleChanged,
    required this.title,
    required this.description,
    required this.englishTitle,
    required this.englishDescription,
    required this.arabicTitle,
    required this.arabicDescription,
  });

  final Locale locale;
  final ValueChanged<Locale> onLocaleChanged;

  final String title;
  final String description;
  final String englishTitle;
  final String englishDescription;
  final String arabicTitle;
  final String arabicDescription;

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    final isDark = Theme
        .of(context)
        .brightness == Brightness.dark;

    final background = isDark
        ? AppColors.backgroundCanvasDark
        : AppColors.backgroundCanvasLight;
    final primaryText = isDark
        ? AppColors.textPrimaryDark
        : AppColors.textPrimaryLight;
    final secondaryText = isDark
        ? AppColors.textSecondaryDark
        : AppColors.textSecondaryLight;

    return Scaffold(
      appBar: AppMainBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset(AppStrings.backIcon),
        ),
        title: localization.languageTitle,
      ),
      backgroundColor: background,
      body: BlocBuilder<LanguageCubit, LanguageState>(
        builder: (context, state) {

          if (state is LanguageFailure) {
            return Center(
              child: Text(state.errorMessage),
            );
          }
          if (state is LanguageLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is LanguageChanged) {
            final isArabic = state.locale.languageCode == 'ar';
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.x24),
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: AppSpacing.x24),
                    Text(
                      title,
                      style: AppTextStyles.headlineLarge(
                        context,
                        text: title,
                        color: primaryText,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.x8),
                    Text(
                      description,
                      style: AppTextStyles.bodyLarge(
                        context,
                        text: description,
                        color: secondaryText,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.x24),
                    SettingsSelectionTile(
                      leading: const LanguageCodeBadge(label: 'EN'),
                      title: englishTitle,
                      subtitle: englishDescription,
                      isSelected: !isArabic,
                      onTap: () => onLocaleChanged(const Locale('en')),
                    ),
                    const SizedBox(height: AppSpacing.x14),
                    SettingsSelectionTile(
                      leading: const LanguageCodeBadge(label: 'ع'),
                      title: arabicTitle,
                      subtitle: arabicDescription,
                      isSelected: isArabic,
                      onTap: () => onLocaleChanged(const Locale('ar')),
                    ),
                  ],
                ),
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
