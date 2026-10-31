import 'package:flutter/material.dart';
import 'package:shop_lite_premium/core/utils/app_spacing.dart';
import 'package:shop_lite_premium/l10n/app_localizations.dart';

import '../../../../core/shared_widgets/app_main_bar.dart';
import '../../../../core/utils/app_strings.dart';
import '../widgets/widgets/product_card_item_image.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = Localizations.of<AppLocalizations>(
      context,
      AppLocalizations,
    );
    return Scaffold(
      appBar: AppMainBar(
        title: localization!.shopLite,
        actions: IconButton(
          onPressed: () {},
          icon: Icon(Icons.notifications_outlined),
        ),
      ),
      body: SingleChildScrollView(
        child: Text("Product View"),
      ),
    );
  }
}
