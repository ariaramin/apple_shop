import 'package:apple_shop/config/theme/app_colors.dart';
import 'package:apple_shop/features/product/data/models/variant.dart';
import 'package:flutter/material.dart';

class VariantItem extends StatelessWidget {
  final int index, currentIndex;
  final Variant variant;

  const VariantItem({
    super.key,
    required this.index,
    required this.currentIndex,
    required this.variant,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: currentIndex == index ? 80 : 78,
      height: currentIndex == index ? 30 : 28,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          width: currentIndex == index ? 2 : 1,
          color: currentIndex == index
              ? AppColors.primaryColor
              : AppColors.greyColor,
        ),
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      duration: const Duration(milliseconds: 250),
      child: Center(
        child: Text(
          variant.value!,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
