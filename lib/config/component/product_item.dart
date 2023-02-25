import 'package:apple_shop/config/component/cashed_image.dart';
import 'package:apple_shop/config/route/app_route_name.dart';
import 'package:apple_shop/config/theme/app_colors.dart';
import 'package:apple_shop/config/utility/utility.dart';
import 'package:apple_shop/feature/product/data/model/product.dart';
import 'package:apple_shop/feature/product/presentation/argument/product_arguments.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(
            AppRouteName.product,
            arguments: ProductArguments(
              productId: product.id!,
              productCategoryId: product.category!,
            ),
          );
        },
        child: Container(
          width: 178,
          height: 216,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 12,
              ),
              Expanded(child: _getItemImage()),
              const SizedBox(
                height: 4,
              ),
              _getBottomSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getItemImage() {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Container(),
        Positioned(
          top: 0,
          right: 10,
          child: SizedBox(
            width: 22,
            child: SvgPicture.asset(
              "assets/icons/like-filled.svg",
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12),
          child: CachedImage(
            imageUrl: product.thumbnail,
          ),
        ),
        Positioned(
          bottom: 0,
          left: 10,
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.redColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 2,
                horizontal: 8,
              ),
              child: Text(
                '${product.persent!.round().toString()} ٪',
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _getBottomSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            bottom: 10,
            right: 10,
          ),
          child: Text(
            product.name!,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 14,
            ),
          ),
        ),
        Container(
          height: 54,
          decoration: const BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.primaryColor,
                blurRadius: 25,
                spreadRadius: -12,
                offset: Offset(0, 16),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  width: 24,
                  child: SvgPicture.asset(
                    'assets/icons/arrow-right-filled.svg',
                  ),
                ),
                const Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      separateByComma(product.price!),
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    Text(
                      separateByComma(product.realPrice!),
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 12,
                ),
                const Text(
                  'تومان',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
