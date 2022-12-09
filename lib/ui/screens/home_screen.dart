import 'package:apple_shop/constants/app_colors.dart';
import 'package:apple_shop/widgets/banner_slider.dart';
import 'package:apple_shop/widgets/category_item.dart';
import 'package:apple_shop/widgets/product_item.dart';
import 'package:apple_shop/widgets/section_title.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: BannerSlider(),
            ),
            SliverPadding(
              padding: const EdgeInsets.only(top: 32),
              sliver: SliverToBoxAdapter(
                child: Center(
                  child: _getCategoryList(),
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.only(top: 32),
              sliver: SliverToBoxAdapter(
                child: Center(
                  child: _getProductList("پر فروش ترین ها"),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Center(
                child: _getProductList("پر بازدید ترین ها"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getProductList(String title) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: SectionTitle(
            title: title,
            isLeadingVisible: true,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Directionality(
          textDirection: TextDirection.rtl,
          child: SizedBox(
            height: 264,
            child: Center(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 8,
                itemBuilder: (context, index) {
                  return const Padding(
                    padding: EdgeInsets.only(
                      left: 10,
                      right: 10,
                      bottom: 38,
                    ),
                    child: Directionality(
                      textDirection: TextDirection.ltr,
                      child: ProductItem(),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _getCategoryList() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: SectionTitle(
            title: "دسته بندی",
            isLeadingVisible: true,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Directionality(
          textDirection: TextDirection.rtl,
          child: SizedBox(
            height: 98,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 8,
              itemBuilder: (context, index) {
                return const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: CategoryItem(),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
