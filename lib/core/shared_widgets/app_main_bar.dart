import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class AppMainBar extends StatelessWidget implements PreferredSizeWidget{
  const AppMainBar({
    super.key, this.leading, this.actions, required this.title,
  });

  final Widget? leading;
  final Widget? actions;
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: 0,
      automaticallyImplyLeading: false,
      leading: leading,
      title: Text(
        title,
        style: AppTextStyles.headlineMedium(context),
      ),
      backgroundColor: AppColors.backgroundCanvasLight,
      actions: [
        actions ?? const SizedBox(),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
