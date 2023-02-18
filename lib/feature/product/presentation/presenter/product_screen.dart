import 'package:apple_shop/config/component/custom_appbar.dart';
import 'package:apple_shop/config/theme/app_colors.dart';
import 'package:apple_shop/feature/product/data/model/product_variant.dart';
import 'package:apple_shop/feature/product/presentation/bloc/product_bloc.dart';
import 'package:apple_shop/feature/product/presentation/bloc/product_event.dart';
import 'package:apple_shop/feature/product/presentation/bloc/product_state.dart';
import 'package:apple_shop/feature/product/presentation/widgets/add_to_cart_button.dart';
import 'package:apple_shop/feature/product/presentation/widgets/comment_image_list.dart';
import 'package:apple_shop/feature/product/presentation/widgets/expandable_container.dart';
import 'package:apple_shop/feature/product/presentation/widgets/price_container.dart';
import 'package:apple_shop/feature/product/presentation/widgets/product_image_container.dart';
import 'package:apple_shop/feature/product/presentation/widgets/variant_list.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  final String productId;

  const ProductScreen({
    super.key,
    required this.productId,
  });

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  var productImage = "";

  @override
  void initState() {
    BlocProvider.of<ProductBloc>(context).add(
      ProductRequest(productId: widget.productId),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            BlocProvider.of<ProductBloc>(context).add(
              ProductRequest(productId: widget.productId),
            );
          },
          child: _getContent(),
        ),
      ),
    );
  }

  Widget _getContent() {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        return CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: CustomAppBar(
                title: "آیفون",
                centerTitle: true,
                titleColor: AppColors.primaryColor,
                leadingIcon: SvgPicture.asset(
                  "assets/icons/apple.svg",
                  color: AppColors.primaryColor,
                ),
                endIcon: SvgPicture.asset(
                  "assets/icons/arrow-right.svg",
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
                endIconOnPressed: () {
                  Navigator.pop(context);
                },
                visibleEndIcon: true,
              ),
            ),
            if (state is ProductLoadingState) ...{
              const SliverFillRemaining(
                child: Center(
                  child: SizedBox(
                    width: 32,
                    height: 32,
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
            },
            SliverToBoxAdapter(
              child: Column(
                children: [
                  if (state is ProductResponseState) ...{
                    state.product.fold((failure) {
                      return SliverFillRemaining(
                        child: Center(child: Text(failure.message ?? "")),
                      );
                    }, (response) {
                      productImage = response.thumbnail!;
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 22),
                        child: Text(
                          response.name!,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                          textDirection: TextDirection.rtl,
                        ),
                      );
                    }),

                    // get images
                    state.productImageList.fold((failure) {
                      return SliverFillRemaining(
                        child: Center(child: Text(failure.message ?? "")),
                      );
                    }, (response) {
                      return ProductImageContainer(
                        productImage: productImage,
                        productImageList: response,
                      );
                    }),

                    // get variants
                    state.productVariantList.fold((failure) {
                      return SliverFillRemaining(
                        child: Center(child: Text(failure.message ?? "")),
                      );
                    }, (response) {
                      return Column(
                        children: [
                          ..._buildVariants(response),
                        ],
                      );
                    }),
                  },
                ],
              ),
            ),
            const SliverToBoxAdapter(
              child: ExpandableContainer(title: "مشخصات فنی:"),
            ),
            const SliverToBoxAdapter(
              child: ExpandableContainer(title: "توضیحات محصول:"),
            ),
            const SliverToBoxAdapter(
              child: ExpandableContainer(
                title: "نظرات کاربران:",
                centerWidget: CommentImageList(),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.only(
                left: 14,
                right: 14,
                bottom: 28,
                top: 38,
              ),
              sliver: SliverToBoxAdapter(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Expanded(child: PriceContainer()),
                    SizedBox(
                      width: 18,
                    ),
                    Expanded(child: AddToCartButton()),
                  ],
                ),
              ),
            ),
            if (state is ProductInitState) ...{
              const SliverFillRemaining(
                child: Center(
                  child: Text('مشکلی پیش آمده است'),
                ),
              ),
            }
          ],
        );
      },
    );
  }

  List<Widget> _buildVariants(List<ProductVariant> variantList) {
    List<Widget> variantWidgets = [];

    for (var variant in variantList) {
      var item = VariantList(productVariant: variant);
      variantWidgets.add(item);
    }
    return variantWidgets;
  }
}
