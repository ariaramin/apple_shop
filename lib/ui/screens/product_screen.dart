import 'package:apple_shop/constants/app_colors.dart';
import 'package:apple_shop/widgets/custom_appbar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: CustomAppBar(
                title: "آیفون",
                centerTitle: true,
                titleColor: AppColors.primaryColor,
                leadingIcon: SvgPicture.asset(
                  "assets/icons/apple.svg",
                  color: AppColors.primaryColor,
                ),
                endIcon: SvgPicture.asset("assets/icons/arrow-right.svg"),
                visibleEndIcon: true,
              ),
            ),
            const SliverToBoxAdapter(
              child: Text(
                "آیفون SE 2022",
                style: TextStyle(
                  fontFamily: "SB",
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
                textDirection: TextDirection.rtl,
              ),
            )
          ],
        ),
      ),
    );
  }
}
