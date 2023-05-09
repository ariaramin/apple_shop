import 'package:apple_shop/config/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CartItemVariant extends StatelessWidget {
  final Widget endContent;

  const CartItemVariant({
    super.key,
    required this.endContent,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
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
            SvgPicture.asset("assets/icons/arrow_up_down.svg"),
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
