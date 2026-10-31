import 'package:flutter/material.dart';
import 'package:shop_lite_premium/l10n/app_localizations.dart';

import '../../../../core/shared_widgets/app_main_bar.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = Localizations.of<AppLocalizations>(
      context,
      AppLocalizations,
    );
    return Scaffold(
      appBar: AppMainBar(
        title: localization!.profile,
      ),
      body: Center(
        child: Text("Profile View", style: TextStyle(fontSize: 30)),
      ),
    );
  }
}
