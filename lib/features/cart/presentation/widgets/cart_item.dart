import 'package:apple_shop/config/component/cached_image.dart';
import 'package:apple_shop/config/extention/int_extention.dart';
import 'package:apple_shop/config/theme/app_colors.dart';
import 'package:apple_shop/features/cart/domain/entities/cart_item_model.dart';
import 'package:apple_shop/features/cart/presentation/widgets/cart_item_detail.dart';
import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  final CartItemModel cartItem;

  const CartItem({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 26),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.greyColor.withOpacity(.3),
            blurRadius: 25,
            spreadRadius: -12,
            offset: const Offset(0.0, 15),
          )
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: CachedImage(imageUrl: cartItem.thumbnail),
                ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  flex: 2,
                  child: CartItemDetail(cartItem: cartItem),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Divider(
              height: 1,
              color: AppColors.greyColor.withOpacity(.5),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  cartItem.realPrice!.separateByComma(),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 4),
                const Text(
                  "تومان",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
