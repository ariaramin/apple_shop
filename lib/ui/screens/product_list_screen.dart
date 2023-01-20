import 'package:apple_shop/core/theme/app_colors.dart';
import 'package:apple_shop/widgets/custom_appbar.dart';
import 'package:apple_shop/widgets/product_item.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

class ProductListScreen extends StatelessWidget {
  String _title;
  ProductListScreen(this._title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: CustomAppBar(
                title: _title,
                titleColor: AppColors.primaryColor,
                centerTitle: true,
                leadingIcon: SvgPicture.asset(
                  "assets/icons/filter.svg",
                ),
                endIcon: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: SvgPicture.asset("assets/icons/arrow-right.svg"),
                ),
                visibleEndIcon: true,
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                bottom: 22,
              ),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return const ProductItem();
                  },
                  childCount: 8,
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2 / 2.6,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 24,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
