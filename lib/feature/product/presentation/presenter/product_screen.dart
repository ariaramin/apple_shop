import 'package:apple_shop/config/component/custom_appbar.dart';
import 'package:apple_shop/config/theme/app_colors.dart';
import 'package:apple_shop/feature/product/presentation/bloc/product_bloc.dart';
import 'package:apple_shop/feature/product/presentation/bloc/product_event.dart';
import 'package:apple_shop/feature/product/presentation/bloc/product_state.dart';
import 'package:apple_shop/feature/product/presentation/widgets/add_to_cart_button.dart';
import 'package:apple_shop/feature/product/presentation/widgets/expandable_container.dart';
import 'package:apple_shop/feature/product/presentation/widgets/price_container.dart';
import 'package:apple_shop/feature/product/presentation/widgets/product_image_container.dart';
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
  int _selectedColorIndex = 0;
  int _selectedSpaceIndex = 0;

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
    var productImage = "";
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
                    })
                  },
                ],
              ),
            ),

            // SliverToBoxAdapter(
            //   child: CustomAppBar(
            //     title: "آیفون",
            //     centerTitle: true,
            //     titleColor: AppColors.primaryColor,
            //     leadingIcon: SvgPicture.asset(
            //       "assets/icons/apple.svg",
            //       color: AppColors.primaryColor,
            //     ),
            //     endIcon: SvgPicture.asset(
            //       "assets/icons/arrow-right.svg",
            //       color: Theme.of(context).colorScheme.onPrimary,
            //     ),
            //     endIconOnPressed: () {
            //       Navigator.pop(context);
            //     },
            //     visibleEndIcon: true,
            //   ),
            // ),
            // const SliverPadding(
            //   padding: EdgeInsets.only(bottom: 22),
            //   sliver: SliverToBoxAdapter(
            //     child: Text(
            //       "آیفون SE 2022",
            //       style: TextStyle(
            //         fontSize: 16,
            //         fontWeight: FontWeight.bold,
            //       ),
            //       textAlign: TextAlign.center,
            //       textDirection: TextDirection.rtl,
            //     ),
            //   ),
            // ),
            // SliverToBoxAdapter(
            //   child: _getImageContainer(),
            // ),
            // SliverToBoxAdapter(
            //   child: _getColorList(),
            // ),
            // SliverToBoxAdapter(
            //   child: _getSpaceList(),
            // ),
            // const SliverToBoxAdapter(
            //   child: ExpandableContainer(title: "مشخصات فنی:"),
            // ),
            // const SliverToBoxAdapter(
            //   child: ExpandableContainer(title: "توضیحات محصول:"),
            // ),
            // SliverToBoxAdapter(
            //   child: ExpandableContainer(
            //     title: "نظرات کاربران:",
            //     centerWidget: _getCommentImageList(),
            //   ),
            // ),
            // SliverPadding(
            //   padding: const EdgeInsets.only(
            //     left: 14,
            //     right: 14,
            //     bottom: 38,
            //     top: 42,
            //   ),
            //   sliver: SliverToBoxAdapter(
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceAround,
            //       crossAxisAlignment: CrossAxisAlignment.center,
            //       children: const [
            //         Expanded(child: PriceContainer()),
            //         SizedBox(
            //           width: 18,
            //         ),
            //         Expanded(child: AddToCartButton()),
            //       ],
            //     ),
            //   ),
            // ),

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

  Widget _getCommentImageList() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 28,
          height: 28,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              width: 2,
              color: Colors.white,
            ),
            image: const DecorationImage(
              image: AssetImage("assets/images/user.png"),
            ),
          ),
        ),
        Positioned(
          right: 15,
          child: Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              color: Colors.pink,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                width: 2,
                color: Colors.white,
              ),
              image: const DecorationImage(
                image: AssetImage("assets/images/user.png"),
              ),
            ),
          ),
        ),
        Positioned(
          right: 30,
          child: Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                width: 2,
                color: Colors.white,
              ),
              image: const DecorationImage(
                image: AssetImage("assets/images/user.png"),
              ),
            ),
          ),
        ),
        Positioned(
          right: 45,
          child: Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                width: 2,
                color: Colors.white,
              ),
              image: const DecorationImage(
                image: AssetImage("assets/images/user.png"),
              ),
            ),
          ),
        ),
        Positioned(
          right: 60,
          child: Container(
            margin: const EdgeInsets.only(left: 10),
            height: 28,
            width: 28,
            decoration: BoxDecoration(
              color: AppColors.greyColor,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                width: 2,
                color: Colors.white,
              ),
            ),
            child: const Center(
              child: Text(
                '+۱۰',
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _getSpaceList() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 14,
        right: 14,
        top: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Text(
            "انتخاب حافظه داخلی",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          SizedBox(
            height: 28,
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: _getSpaceItem(index),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getSpaceItem(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedSpaceIndex = index;
        });
      },
      child: AnimatedContainer(
        width: 78,
        height: 28,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            width: _selectedSpaceIndex == index ? 2 : 1,
            color: _selectedSpaceIndex == index
                ? AppColors.primaryColor
                : AppColors.greyColor,
          ),
          color: Theme.of(context).colorScheme.primaryContainer,
        ),
        duration: const Duration(milliseconds: 300),
        child: const Center(
          child: Text(
            "۱۲۸",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _getColorList() {
    var colors = [
      ["مشکی", Colors.black],
      ["سبز", Colors.green[900]],
      ["آبی", Colors.blue[900]]
    ];
    return Padding(
      padding: const EdgeInsets.only(
        left: 14,
        right: 14,
        top: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Text(
            "انتخاب رنگ",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          SizedBox(
            height: 28,
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: colors.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: _getColorItem(index, colors[index]),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getColorItem(
    int index,
    List<Object?> color,
  ) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedColorIndex = index;
        });
      },
      child: AnimatedContainer(
        width: _selectedColorIndex == index ? 78 : 28,
        height: 28,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: color[1] as Color,
        ),
        duration: const Duration(milliseconds: 300),
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Positioned(
              right: 36,
              child: Text(
                color[0] as String,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
            ),
            Positioned(
              right: 0,
              child: Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    width: 1,
                    color: AppColors.greyColor,
                  ),
                  color: color[1] as Color,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
