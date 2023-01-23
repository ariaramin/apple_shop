import 'package:apple_shop/config/theme/app_colors.dart';
import 'package:apple_shop/feature/cart/presentation/widgets/cart_item.dart';
import 'package:apple_shop/config/component/custom_appbar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: CustomAppBar(
                    title: "سبد خرید",
                    centerTitle: true,
                    titleColor: AppColors.primaryColor,
                    leadingIcon: SvgPicture.asset(
                      "assets/icons/apple.svg",
                      color: AppColors.primaryColor,
                    ),
                    visibleEndIcon: false,
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.only(
                    left: 24,
                    right: 24,
                    bottom: 58,
                  ),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return const CartItem();
                      },
                      childCount: 4,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 18),
              child: _getPayButton(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getPayButton() {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            backgroundColor: AppColors.greenColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: const Text(
            "ادامه فرآیند خرید",
            style: TextStyle(
              fontFamily: "SB",
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}