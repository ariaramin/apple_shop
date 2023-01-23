import 'package:apple_shop/config/component/category_item.dart';
import 'package:apple_shop/config/component/custom_appbar.dart';
import 'package:apple_shop/config/component/product_item.dart';
import 'package:apple_shop/config/route/app_route_name.dart';
import 'package:apple_shop/config/theme/app_colors.dart';
import 'package:apple_shop/feature/home/presentation/widgets/banner_slider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: _getContent(context),
      ),
    );
  }

  Widget _getContent(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: CustomAppBar(
            title: "جستجوی محصولات",
            centerTitle: false,
            leadingIcon: SvgPicture.asset(
              "assets/icons/apple.svg",
              color: AppColors.primaryColor,
            ),
            endIcon: SvgPicture.asset("assets/icons/search.svg"),
            visibleEndIcon: true,
          ),
        ),
        SliverToBoxAdapter(
          child: BannerSlider(),
        ),
        SliverPadding(
          padding: const EdgeInsets.only(top: 32),
          sliver: SliverToBoxAdapter(
            child: Center(
              child: _getCategoryList(context),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.only(top: 32),
          sliver: SliverToBoxAdapter(
            child: Center(
              child: _getProductList(context, "پرفروش ترین ها"),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.only(top: 12),
          sliver: SliverToBoxAdapter(
            child: Center(
              child: _getProductList(context, "پربازدید ترین ها"),
            ),
          ),
        ),
      ],
    );
  }

  Widget _getProductList(BuildContext context, String title) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: _getSectionTitle(context, title, true),
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

  Widget _getCategoryList(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              Text(
                "دسته بندی ها",
                style: TextStyle(
                  fontFamily: "SB",
                  fontSize: 14,
                  color: AppColors.greyColor,
                ),
              ),
            ],
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
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: CategoryItem(
                    title: 'آیفون',
                    icon: SvgPicture.asset("assets/icons/phone.svg"),
                    color: const Color(0xffFBAD40),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _getSectionTitle(
    BuildContext context,
    String title,
    bool visibleLeadingText,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Visibility(
          visible: visibleLeadingText,
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(AppRouteName.productList);
            },
            child: Row(
              children: [
                SizedBox(
                  width: 20,
                  child: SvgPicture.asset("assets/icons/arrow-left.svg"),
                ),
                const SizedBox(
                  width: 8,
                ),
                const Text(
                  "مشاهده همه",
                  style: TextStyle(
                    fontFamily: "SB",
                    fontSize: 12,
                    color: AppColors.primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
        Text(
          title,
          style: const TextStyle(
            fontFamily: "SB",
            fontSize: 14,
            color: AppColors.greyColor,
          ),
        ),
      ],
    );
  }
}
