import 'package:apple_shop/config/component/custom_appbar.dart';
import 'package:apple_shop/config/theme/app_colors.dart';
import 'package:apple_shop/feature/product/data/model/product_variant.dart';
import 'package:apple_shop/feature/product/data/model/property.dart';
import 'package:apple_shop/feature/product/presentation/argument/product_arguments.dart';
import 'package:apple_shop/feature/product/presentation/bloc/product_bloc.dart';
import 'package:apple_shop/feature/product/presentation/bloc/product_event.dart';
import 'package:apple_shop/feature/product/presentation/bloc/product_state.dart';
import 'package:apple_shop/feature/product/presentation/widgets/add_to_cart_button.dart';
import 'package:apple_shop/feature/product/presentation/widgets/comment_image_list.dart';
import 'package:apple_shop/feature/product/presentation/widgets/expandable_container.dart';
import 'package:apple_shop/feature/product/presentation/widgets/expandable_content.dart';
import 'package:apple_shop/feature/product/presentation/widgets/price_container.dart';
import 'package:apple_shop/feature/product/presentation/widgets/product_image_container.dart';
import 'package:apple_shop/feature/product/presentation/widgets/variant_list.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  final ProductArguments arguments;

  const ProductScreen({
    super.key,
    required this.arguments,
  });

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  var productImage = "";

  @override
  void initState() {
    BlocProvider.of<ProductBloc>(context).add(
      ProductRequest(
        productId: widget.arguments.productId,
        productCategoryId: widget.arguments.productCategoryId,
      ),
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
              ProductRequest(
                productId: widget.arguments.productId,
                productCategoryId: widget.arguments.productCategoryId,
              ),
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
              child: CustomAppBar(
                title: _getProductCategory(state),
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
            SliverToBoxAdapter(
              child: Column(
                children: [
                  if (state is ProductResponseState) ...{
                    state.product.fold((failure) {
                      return Center(child: Text(failure.message ?? ""));
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
                      return Center(child: Text(failure.message ?? ""));
                    }, (response) {
                      return ProductImageContainer(
                        productImage: productImage,
                        productImageList: response,
                      );
                    }),

                    // get variants
                    state.productVariantList.fold((failure) {
                      return Center(child: Text(failure.message ?? ""));
                    }, (response) {
                      return Column(
                        children: [
                          ..._buildVariants(response),
                        ],
                      );
                    }),

                    // get property
                    state.productProperties.fold((failure) {
                      return Center(child: Text(failure.message ?? ""));
                    }, (response) {
                      return ExpandableContainer(
                        title: "مشخصات فنی:",
                        text: _getProperties(response),
                      );
                    }),

                    // get description
                    state.product.fold((failure) {
                      return Center(child: Text(failure.message ?? ""));
                    }, (response) {
                      return ExpandableContainer(
                        title: "توضیحات محصول:",
                        text: response.description,
                      );
                    }),
                  },
                ],
              ),
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

  String _getProperties(List<Property> propertyList) {
    var text = "";
    for (var property in propertyList) {
      text = propertyList.last != property
          ? "${property.title}: ${property.value} \n"
          : "${property.title}: ${property.value}";
    }
    return text;
  }

  List<Widget> _buildVariants(List<ProductVariant> variantList) {
    List<Widget> variantWidgets = [];

    for (var variant in variantList) {
      var item = VariantList(productVariant: variant);
      variantWidgets.add(item);
    }
    return variantWidgets;
  }

  String _getProductCategory(ProductState state) {
    var categoryTitle = "";
    if (state is ProductResponseState) {
      state.productCategory.fold(
        (failure) => "",
        (response) => categoryTitle = response.title!,
      );
    }
    return categoryTitle;
  }
}
