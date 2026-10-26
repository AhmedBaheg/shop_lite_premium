import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:shop_lite_premium/core/localization/language_cubit.dart';
import 'package:shop_lite_premium/core/localization/language_storage.dart';
import 'package:shop_lite_premium/features/product/presentation/views/product_view.dart';

import 'core/theme/app_colors.dart';
import 'core/utils/constant.dart';
import 'features/auth/presentation/views/views/auth_parent.dart';
import 'l10n/app_localizations.dart';

Future<void> main() async {
  await Constant.setUp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              LanguageCubit(storage: LanguageStorage())..getLanguage(),
        ),
      ],
      child: BlocBuilder<LanguageCubit, LanguageState>(
        builder: (context, state) {
          final locale = state is LanguageChanged
              ? state.locale
              : const Locale('en');
          return MaterialApp(
            locale: locale,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              scaffoldBackgroundColor: AppColors.backgroundCanvasLight,
            ),
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            home: Hive.box<String>(Constant.uidBox).containsKey(Constant.uidBox)
                ? ProductView()
                : AuthParent(),
          );
        },
      ),
    );
  }
}
