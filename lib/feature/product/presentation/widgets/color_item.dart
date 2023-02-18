import 'package:apple_shop/config/theme/app_colors.dart';
import 'package:apple_shop/feature/product/data/model/variant.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ColorItem extends StatelessWidget {
  final int index, currentIndex;
  final Variant color;

  const ColorItem({
    super.key,
    required this.index,
    required this.currentIndex,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: currentIndex == index ? 30 : 28,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          width: currentIndex == index ? 2 : 1,
          color: currentIndex == index
              ? AppColors.primaryColor
              : AppColors.greyColor,
        ),
      ),
      duration: const Duration(milliseconds: 250),
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: Row(
          children: [
            Container(
              width: 22,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: HexColor(color.value!),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                color.name!,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
