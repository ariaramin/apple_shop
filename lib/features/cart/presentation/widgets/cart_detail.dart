import 'package:apple_shop/config/extention/int_extention.dart';
import 'package:apple_shop/config/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CartDetail extends StatelessWidget {
  const CartDetail({
    super.key,
    required int totalPrice,
    required int finalPrice,
    required int totalDiscount,
  })  : _totalPrice = totalPrice,
        _finalPrice = finalPrice,
        _totalDiscount = totalDiscount;

  final int _totalPrice;
  final int _finalPrice;
  final int _totalDiscount;

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
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("قیمت کالاها"),
                Text("${_totalPrice.separateByComma()} تومان")
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("جمع سبد خرید"),
                Text("${_finalPrice.separateByComma()} تومان")
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "سود شما از خرید",
                  style: TextStyle(color: AppColors.redColor),
                ),
                Text(
                  "${_totalDiscount.separateByComma()} تومان",
                  style: const TextStyle(color: AppColors.redColor),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
