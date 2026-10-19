import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_lite_premium/core/localization/language_cubit.dart';
import 'package:shop_lite_premium/core/localization/language_storage.dart';
import 'package:shop_lite_premium/features/auth/presentation/views/login_view.dart';

import 'core/utils/constant.dart';
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
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            home: LoginView(),
          );
        },
      ),
    );
  }
}
