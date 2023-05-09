import 'package:apple_shop/config/component/discount_badge.dart';
import 'package:apple_shop/config/extention/int_extention.dart';
import 'package:apple_shop/config/theme/app_colors.dart';
import 'package:apple_shop/features/cart/domain/entities/cart_item_model.dart';
import 'package:apple_shop/features/cart/presentation/widgets/cart_item_variant_list.dart';
import 'package:flutter/material.dart';

class CartItemDetail extends StatelessWidget {
  final CartItemModel cartItem;

  const CartItemDetail({
    super.key,
    required this.cartItem,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          cartItem.name!,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          overflow: TextOverflow.ellipsis,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text(
            "گارانتی 18 ماه مدیا پردازش",
            style: TextStyle(
              fontSize: 12,
              color: AppColors.greyColor,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              cartItem.price!.separateByComma(),
              style: const TextStyle(
                fontSize: 12,
                color: AppColors.greyColor,
              ),
            ),
            const SizedBox(width: 2),
            const Text(
              "تومان",
              style: TextStyle(
                fontSize: 10,
                color: AppColors.greyColor,
              ),
            ),
            const SizedBox(width: 6),
            DiscountBadge(percent: cartItem.percent!)
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        CartItemVariantList(cartItem: cartItem)
      ],
    );
  }
}
