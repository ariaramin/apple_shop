import 'package:apple_shop/config/component/chip_item.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

class ProfileOptions extends StatelessWidget {
  const ProfileOptions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Wrap(
        spacing: 28,
        runSpacing: 20,
        runAlignment: WrapAlignment.center,
        alignment: WrapAlignment.center,
        children: [
          ChipItem(
            title: "سفارشات اخیر",
            icon: SizedBox(
              width: 24,
              height: 24,
              child: SvgPicture.asset("assets/icons/recent_orders.svg"),
            ),
          ),
          ChipItem(
            title: "آدرس ها",
            icon: SizedBox(
              width: 24,
              height: 24,
              child: SvgPicture.asset("assets/icons/location.svg"),
            ),
          ),
          ChipItem(
            title: "علاقمندی ها",
            icon: SizedBox(
              width: 24,
              height: 24,
              child: SvgPicture.asset("assets/icons/heart.svg"),
            ),
          ),
          ChipItem(
            title: "نقد و نظرات",
            icon: SizedBox(
              width: 24,
              height: 24,
              child: SvgPicture.asset("assets/icons/comments.svg"),
            ),
          ),
          ChipItem(
            title: "تخفیف ها",
            icon: SizedBox(
              width: 24,
              height: 24,
              child: SvgPicture.asset("assets/icons/discounts.svg"),
            ),
          ),
          ChipItem(
            title: "اطلاعیه",
            icon: SizedBox(
              width: 24,
              height: 24,
              child: SvgPicture.asset("assets/icons/notification.svg"),
            ),
          ),
          ChipItem(
            title: "بلاگ",
            icon: SizedBox(
              width: 24,
              height: 24,
              child: SvgPicture.asset("assets/icons/paper.svg"),
            ),
          ),
          ChipItem(
            title: "پشتیبانی",
            icon: SizedBox(
              width: 24,
              height: 24,
              child: SvgPicture.asset("assets/icons/call.svg"),
            ),
          ),
        ],
      ),
    );
  }
}
