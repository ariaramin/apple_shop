import 'package:apple_shop/config/component/cached_image.dart';
import 'package:apple_shop/config/theme/app_colors.dart';
import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  final String image;
  const ProductImage({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 74,
      height: 74,
      margin: const EdgeInsets.symmetric(horizontal: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          width: 1,
          color: AppColors.greyColor,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: CachedImage(
          imageUrl: image,
        ),
      ),
    );
  }
}
