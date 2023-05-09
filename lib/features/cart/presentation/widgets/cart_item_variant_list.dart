import 'package:apple_shop/config/theme/app_colors.dart';
import 'package:apple_shop/features/cart/domain/entities/cart_item_model.dart';
import 'package:apple_shop/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:apple_shop/features/cart/presentation/bloc/cart_event.dart';
import 'package:apple_shop/features/cart/presentation/widgets/cart_item_action.dart';
import 'package:apple_shop/features/cart/presentation/widgets/cart_item_variant.dart';
import 'package:apple_shop/features/product/data/models/variant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';

class CartItemVariantList extends StatelessWidget {
  final CartItemModel cartItem;

  const CartItemVariantList({
    super.key,
    required this.cartItem,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Wrap(
        spacing: 10,
        runSpacing: 10,
        children: [
          _colorVariant(cartItem.color),
          ..._buildVariants(cartItem.variantList!),
          CartItemVariant(
            endContent: Text(
              cartItem.quantity.toString(),
              style: const TextStyle(
                fontSize: 12,
                color: AppColors.greyColor,
              ),
              textDirection: TextDirection.rtl,
            ),
          ),
          CartItemAction(
            title: "ذخیره",
            endContent: SizedBox(
              width: 14,
              height: 14,
              child: SvgPicture.asset("assets/icons/like-filled.svg"),
            ),
          ),
          CartItemAction(
            title: "حذف",
            endContent: SizedBox(
              width: 14,
              height: 14,
              child: SvgPicture.asset("assets/icons/trash.svg"),
            ),
            onTap: () {
              BlocProvider.of<CartBloc>(context)
                  .add(DeleteCartItemEvent(cartItem: cartItem));
            },
          ),
        ],
      ),
    );
  }

  List<Widget> _buildVariants(List<Variant> variantList) {
    List<Widget> variantWidgets = [];

    for (var variant in variantList) {
      var item = _variant(variant.value!);
      variantWidgets.add(item);
    }
    return variantWidgets;
  }

  CartItemVariant _variant(String text) {
    return CartItemVariant(
      endContent: Text(
        text,
        style: const TextStyle(
          fontSize: 12,
          color: AppColors.greyColor,
        ),
        textDirection: TextDirection.rtl,
      ),
    );
  }

  Widget _colorVariant(Variant? color) {
    return color != null
        ? CartItemVariant(
            endContent: Row(
              children: [
                Text(
                  color.name!,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.greyColor,
                  ),
                  textDirection: TextDirection.rtl,
                ),
                const SizedBox(
                  width: 4,
                ),
                Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: HexColor(color.value!),
                    borderRadius: BorderRadius.circular(28),
                  ),
                ),
              ],
            ),
          )
        : const SizedBox();
  }
}
