import 'package:apple_shop/config/component/category_item.dart';
import 'package:apple_shop/config/theme/app_colors.dart';
import 'package:apple_shop/config/component/custom_appbar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(
              title: "حساب کاربری",
              centerTitle: true,
              titleColor: AppColors.primaryColor,
              leadingIcon: SvgPicture.asset(
                "assets/icons/apple.svg",
                color: AppColors.primaryColor,
              ),
              visibleEndIcon: false,
            ),
            const Text(
              "آریا رامین",
              style: TextStyle(
                fontFamily: "SB",
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            const Text(
              "09123456789",
              style: TextStyle(
                fontFamily: "SB",
                fontSize: 10,
                color: AppColors.greyColor,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            _getOptionList(),
          ],
        ),
      ),
    );
  }

  Widget _getOptionList() {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Wrap(
        spacing: 28,
        runSpacing: 20,
        runAlignment: WrapAlignment.center,
        alignment: WrapAlignment.center,
        children: [
          CategoryItem(
            title: "سفارشات اخیر",
            icon: SvgPicture.asset("assets/icons/recent_orders.svg"),
          ),
          CategoryItem(
            title: "آدرس ها",
            icon: SvgPicture.asset("assets/icons/location.svg"),
          ),
          CategoryItem(
            title: "علاقمندی ها",
            icon: SvgPicture.asset("assets/icons/heart.svg"),
          ),
          CategoryItem(
            title: "نقد و نظرات",
            icon: SvgPicture.asset("assets/icons/comments.svg"),
          ),
          CategoryItem(
            title: "تخفیف ها",
            icon: SvgPicture.asset("assets/icons/discounts.svg"),
          ),
          CategoryItem(
            title: "اطلاعیه",
            icon: SvgPicture.asset("assets/icons/notification.svg"),
          ),
          CategoryItem(
            title: "بلاگ",
            icon: SvgPicture.asset("assets/icons/paper.svg"),
          ),
          CategoryItem(
            title: "پشتیبانی",
            icon: SvgPicture.asset("assets/icons/call.svg"),
          ),
        ],
      ),
    );
  }
  // Widget _getOptionList() {
  //   return Directionality(
  //     textDirection: TextDirection.rtl,
  //     child: Wrap(
  //       spacing: 20,
  //       runSpacing: 20,
  //       runAlignment: WrapAlignment.center,
  //       alignment: WrapAlignment.center,
  //       children: [
  //         CategoryItem(
  //           title: "سفارشات اخیر",
  //           icon: SvgPicture.asset("assets/icons/recent_orders.svg"),
  //         ),
  //         CategoryItem(
  //           title: "آدرس ها",
  //           icon: SvgPicture.asset("assets/icons/location.svg"),
  //         ),
  //         CategoryItem(
  //           title: "علاقمندی ها",
  //           icon: SvgPicture.asset("assets/icons/heart.svg"),
  //         ),
  //         CategoryItem(
  //           title: "نقد و نظرات",
  //           icon: SvgPicture.asset("assets/icons/comments.svg"),
  //         ),
  //         CategoryItem(
  //           title: "تخفیف ها",
  //           icon: SvgPicture.asset("assets/icons/discounts.svg"),
  //         ),
  //         CategoryItem(
  //           title: "اطلاعیه",
  //           icon: SvgPicture.asset("assets/icons/notification.svg"),
  //         ),
  //         CategoryItem(
  //           title: "بلاگ",
  //           icon: SvgPicture.asset("assets/icons/paper.svg"),
  //         ),
  //         CategoryItem(
  //           title: "پشتیبانی",
  //           icon: SvgPicture.asset("assets/icons/call.svg"),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
