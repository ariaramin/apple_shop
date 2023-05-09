import 'package:apple_shop/config/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CartItemAction extends StatelessWidget {
  final String title;
  final Widget endContent;
  final Function()? onTap;

  const CartItemAction({
    super.key,
    required this.title,
    required this.endContent,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 4,
          horizontal: 8,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: AppColors.greyColor.withOpacity(.5),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 12,
                color: AppColors.greyColor,
              ),
              textDirection: TextDirection.rtl,
            ),
            const SizedBox(
              width: 8,
            ),
            endContent,
          ],
        ),
      ),
    );
  }
}
