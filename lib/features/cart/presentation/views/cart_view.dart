import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_lite_premium/core/shared_widgets/empty_state_widget.dart';
import 'package:shop_lite_premium/core/shared_widgets/primary_button.dart';
import 'package:shop_lite_premium/features/cart/data/data_sources/remote/cart_firestore_remote_data_source_impl.dart';
import 'package:shop_lite_premium/features/cart/data/repo/cart_repo_impl.dart';
import 'package:shop_lite_premium/features/cart/domain/use_cases/add_to_cart_use_case.dart';
import 'package:shop_lite_premium/features/cart/domain/use_cases/change_cart_quantity_use_case.dart';
import 'package:shop_lite_premium/features/cart/domain/use_cases/get_cart_items_use_case.dart';
import 'package:shop_lite_premium/features/cart/presentation/widgets/list_view_builder_widget.dart';
import 'package:shop_lite_premium/features/product/domain/entities/product_entity.dart';
import 'package:shop_lite_premium/l10n/app_localizations.dart';

import '../../../../core/shared_widgets/app_loading_indicator.dart';
import '../../../../core/shared_widgets/app_main_bar.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/app_spacing.dart';
import '../../../../core/utils/app_strings.dart';
import '../../domain/use_cases/delete_cart_item_use_case.dart';
import '../cubits/cart_cubit.dart';
import '../widgets/cart_order_summary.dart';

class CartView extends StatelessWidget {
  const CartView({
    super.key,
    this.productEntity,
    this.padding = EdgeInsets.zero,
    this.showBackIcon = false,
  });

  final ProductEntity? productEntity;
  final EdgeInsetsGeometry padding;
  final bool showBackIcon;

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    return BlocProvider(
      create: (context) => CartCubit(
        addToCartUseCase: AddToCartUseCase(
          cartRepo: CartRepoImpl(
            cartFirestoreRemoteDataSource: CartFirestoreRemoteDataSourceImpl(),
          ),
        ),
        getCartItemsUseCase: GetCartItemsUseCase(
          cartRepo: CartRepoImpl(
            cartFirestoreRemoteDataSource: CartFirestoreRemoteDataSourceImpl(),
          ),
        ),
        changeCartQuantityUseCase: ChangeCartQuantityUseCase(
          cartRepo: CartRepoImpl(
            cartFirestoreRemoteDataSource: CartFirestoreRemoteDataSourceImpl(),
          ),
        ),
        deleteCartItemUseCase: DeleteCartItemUseCase(
          cartRepo: CartRepoImpl(
            cartFirestoreRemoteDataSource: CartFirestoreRemoteDataSourceImpl(),
          ),
        ),
      )..fetchCartItems(),
      child: Scaffold(
        appBar: AppMainBar(
          leading: showBackIcon
              ? IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: SvgPicture.asset(AppStrings.backIcon),
                )
              : null,
          title: localization.cart,
        ),
        body: BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            if (state is CartLoading) {
              return const Center(child: AppLoadingIndicator());
            } else if (state is CartFailure) {
              return Center(child: Text(state.errorMessage));
            } else if (state is CartSuccess) {
              final cartItemsList = state.cartItemsList;
              return cartItemsList.isEmpty ? EmptyStateWidget(
                icon: Icons.shopping_cart_outlined,
                title: 'Your cart is empty',
                description: 'You haven’t added any products to your cart yet.',
              ) : Padding(
                padding: padding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: AppSpacing.x10),
                    Text(
                      "${cartItemsList.length} ${localization.itemsInYourCart}",
                      style: AppTextStyles.titleSmall(context).copyWith(),
                    ),
                    SizedBox(height: AppSpacing.x18),
                    Expanded(
                      child: ListViewBuilderWidget(
                        cartItemsList: cartItemsList,
                      ),
                    ),
                    SizedBox(height: AppSpacing.x18),

                    CartOrderSummary(
                      localization: localization,
                      cartItemsList: cartItemsList,
                    ),
                    SizedBox(height: AppSpacing.x20),

                    PrimaryButton(
                      onPressed: () {},
                      text: localization.continueToCheckout,
                    ),
                    SizedBox(height: AppSpacing.x32),
                    Center(
                      child: Text(
                        localization.secure,
                        style: AppTextStyles.bodySmall(context),
                      ),
                    ),
                    SizedBox(height: AppSpacing.x18),
                  ],
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
