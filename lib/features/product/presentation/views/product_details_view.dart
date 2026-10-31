import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_lite_premium/core/shared_widgets/app_main_bar.dart';
import 'package:shop_lite_premium/core/shared_widgets/primary_button.dart';
import 'package:shop_lite_premium/core/utils/app_spacing.dart';
import 'package:shop_lite_premium/features/cart/domain/entities/cart_entity.dart';
import 'package:shop_lite_premium/features/cart/presentation/views/cart_view.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../cart/data/data_sources/remote/cart_firestore_remote_data_source_impl.dart';
import '../../../cart/data/repo/cart_repo_impl.dart';
import '../../../cart/domain/use_cases/add_to_cart_use_case.dart';
import '../../../cart/presentation/cubits/cart_cubit.dart';
import '../../../wishlist/presentation/cubits/favorite/favorite_cubit.dart';
import '../../domain/entities/product_entity.dart';
import '../widgets/widgets/product_card_item_image.dart';
import '../widgets/widgets/product_color_selector.dart';
import '../widgets/widgets/product_details_meta.dart';
import '../widgets/widgets/product_info_section.dart';

class ProductDetailsView extends StatefulWidget {
  const ProductDetailsView({super.key, required this.productEntity});

  final ProductEntity productEntity;

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  Color selectedColor = AppColors.productBackgroundSand;

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppMainBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset(AppStrings.backIcon),
        ),
        title: localization.shopLite,
        actions: BlocBuilder<FavoriteCubit, FavoriteState>(
          builder: (context, state) {
            final isFavorite = context.read<FavoriteCubit>().isFavorite(
              widget.productEntity.id!,
            );
            return IconButton(
              onPressed: () {
                context.read<FavoriteCubit>().toggleFavorite(
                  widget.productEntity,
                );
              },
              icon: isFavorite
                  ? const Icon(
                Icons.favorite_rounded,
                size: 21,
                color: Colors.red,
              )
                  : const Icon(
                Icons.favorite_border_rounded,
                size: 21,
                color: AppColors.actionPrimaryLight,
              ),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProductCardItemImage(
                image: widget.productEntity.image ?? "",
                height: 300,
                color: selectedColor,
              ),
              SizedBox(height: AppSpacing.x18),
              ProductDetailsMeta(widget: widget),
              SizedBox(height: AppSpacing.x8),
              ProductInfoSection(widget: widget),
              SizedBox(height: AppSpacing.x18),
              ProductColorSelector(
                selectedColor: selectedColor,
                onColorSelected: (Color value) {
                  setState(() {
                    selectedColor = value;
                  });
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BlocProvider(
        create: (context) => CartCubit(
          addToCartUseCase: AddToCartUseCase(
            cartRepo: CartRepoImpl(
              cartFirestoreRemoteDataSource: CartFirestoreRemoteDataSourceImpl(),
            ),
          ),
        ),
        child: Builder(
          builder: (context) {
            return BlocListener<CartCubit, CartState>(
              listener: (context, state) {
                if (state is AddToCartSuccess) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          CartView(
                            productEntity: widget.productEntity,
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            showBackIcon: true,
                          ),
                    ),
                  );
                }else if(state is CartFailure){
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.errorMessage),
                    ),
                  );
                }
              },
              child: SafeArea(
                minimum: const EdgeInsets.only(left: 24, right: 24, bottom: 50),
                child: PrimaryButton(
                  onPressed: () async {
                    await context.read<CartCubit>().addToCart(
                      cartEntity: CartEntity(productEntity: widget.productEntity),
                    );

                  },
                  text: "${localization.addToCart} —— \$${widget.productEntity
                      .price}",
                  icon: AppStrings.cartIcon,
                ),
              ),
            );
          }
        ),
      ),
    );
  }
}
