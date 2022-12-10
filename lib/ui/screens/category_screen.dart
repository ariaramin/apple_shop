import 'package:apple_shop/constants/app_colors.dart';
import 'package:apple_shop/widgets/custom_appbar.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: CustomAppBar(
                title: "دسته بندی",
                titleColor: AppColors.primaryColor,
                centerTitle: true,
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
                bottom: 22,
              ),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image: const DecorationImage(
                          image: AssetImage("assets/images/category.png"),
                        ),
                      ),
                    );
                  },
                  childCount: 8,
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
