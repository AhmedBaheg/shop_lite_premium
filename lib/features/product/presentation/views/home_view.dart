import 'package:flutter/material.dart';
import 'package:shop_lite_premium/core/shared_widgets/app_bottom_navigation_bar.dart';
import 'package:shop_lite_premium/features/profile/presentation/views/profile_view.dart';
import 'package:shop_lite_premium/features/wishlist/presentation/views/wishlist_view.dart';

import '../../../cart/presentation/views/cart_view.dart';
import 'product_parent_view.dart';
import 'product_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _ProductViewState();
}

class _ProductViewState extends State<HomeView> {
  int currentIndex = 0;
  List<Widget> pages = [
    ProductView(),
    ProductParentView(),
    WishlistView(),
    CartView(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: AppBottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: pages.elementAt(currentIndex),
      ),
    );
  }
}
