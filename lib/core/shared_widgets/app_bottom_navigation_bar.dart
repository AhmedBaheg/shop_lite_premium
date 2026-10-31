import 'package:flutter/material.dart';
import 'package:shop_lite_premium/l10n/app_localizations.dart';

import '../theme/app_colors.dart';

class AppBottomNavigationBar extends StatefulWidget {
  const AppBottomNavigationBar({
    super.key,
    this.onTap,
    required this.currentIndex,
  });

  final ValueChanged<int>? onTap;
  final int currentIndex;

  @override
  State<AppBottomNavigationBar> createState() => _AppBottomNavigationBarState();
}

class _AppBottomNavigationBarState extends State<AppBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    final localization = Localizations.of<AppLocalizations>(
      context,
      AppLocalizations,
    );
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border(top: BorderSide(color: Color(0xFFE5EAF2), width: 0.7)),
      ),
      child: BottomNavigationBar(
        currentIndex: widget.currentIndex,
        onTap: (index) {
          widget.onTap!(index);
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.white,
        elevation: 0,

        selectedItemColor: AppColors.actionPrimaryLight,
        unselectedItemColor: const Color(0xFF64748B),

        selectedLabelStyle: const TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w400,
        ),

        showSelectedLabels: true,
        showUnselectedLabels: true,
        enableFeedback: false,

        items: [
          BottomNavigationBarItem(
            icon: widget.currentIndex == 0
                ? Icon(Icons.home)
                : Icon(Icons.home_outlined),
            label: localization!.home,
          ),
          BottomNavigationBarItem(
            icon: widget.currentIndex == 1
                ? Icon(Icons.explore)
                : Icon(Icons.explore_outlined),
            label: localization.explore,
          ),
          BottomNavigationBarItem(
            icon: widget.currentIndex == 2
                ? Icon(Icons.favorite)
                : Icon(Icons.favorite_border_rounded),
            label: localization.wishlist,
          ),
          BottomNavigationBarItem(
            icon: widget.currentIndex == 3
                ? Icon(Icons.shopping_cart)
                : Icon(Icons.shopping_cart_outlined),
            label: localization.cart,
          ),
          BottomNavigationBarItem(
            icon: widget.currentIndex == 4
                ? Icon(Icons.person)
                : Icon(Icons.person_outline_rounded),
            label: localization.profile,
          ),
        ],
      ),
    );
  }
}
