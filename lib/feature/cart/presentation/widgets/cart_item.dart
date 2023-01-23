import 'package:apple_shop/config/theme/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 26),
      decoration: BoxDecoration(
        color: Colors.white,
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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: _getProductItem(),
                ),
                const SizedBox(
                  width: 12,
                ),
                Image.asset("assets/images/iphone-13.png"),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Divider(
              height: 1,
              color: AppColors.greyColor.withOpacity(.5),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4),
                  child: Text(
                    "تومان",
                    style: TextStyle(
                      fontFamily: "SB",
                      fontSize: 12,
                    ),
                  ),
                ),
                Text(
                  "۴۵٬۳۵۰٬۰۰۰",
                  style: TextStyle(
                    fontFamily: "SB",
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _getProductItem() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Text(
          "آیفون ۱۳ پرومکس دوسیم کارت",
          style: TextStyle(
            fontFamily: "SB",
            fontSize: 16,
          ),
          overflow: TextOverflow.ellipsis,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text(
            "گارانتی 18 ماه مدیا پردازش",
            style: TextStyle(
              fontFamily: "SM",
              fontSize: 12,
              color: AppColors.greyColor,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColors.redColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 2,
                  horizontal: 8,
                ),
                child: Text(
                  '٪۳',
                  style: TextStyle(
                    fontFamily: 'SB',
                    fontSize: 10,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 4),
              child: Text(
                "تومان",
                style: TextStyle(
                  fontFamily: "SM",
                  fontSize: 10,
                  color: AppColors.greyColor,
                ),
              ),
            ),
            const Text(
              "۴۶٬۰۰۰٬۰۰۰",
              style: TextStyle(
                fontFamily: "SM",
                fontSize: 12,
                color: AppColors.greyColor,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        _getProductVariants()
      ],
    );
  }

  Widget _getProductVariants() {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Wrap(
        spacing: 10,
        runSpacing: 10,
        children: [
          _getVariantItem(
            endContent: const Text(
              "۲۵۶ گیگابایت",
              style: TextStyle(
                fontFamily: "SM",
                fontSize: 12,
                color: AppColors.greyColor,
              ),
              textDirection: TextDirection.rtl,
            ),
          ),
          _getVariantItem(
            endContent: Row(
              children: [
                const Text(
                  "سبز کله غازی",
                  style: TextStyle(
                    fontFamily: "SM",
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
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(28),
                  ),
                ),
              ],
            ),
          ),
          _getVariantItem(
            endContent: const Text(
              "۱",
              style: TextStyle(
                fontFamily: "SM",
                fontSize: 12,
                color: AppColors.greyColor,
              ),
              textDirection: TextDirection.rtl,
            ),
          ),
          _getActionItem(
            title: "ذخیره",
            endContent: SizedBox(
              width: 14,
              height: 14,
              child: SvgPicture.asset("assets/icons/like-filled.svg"),
            ),
          ),
          _getActionItem(
            title: "حذف",
            endContent: SizedBox(
              width: 14,
              height: 14,
              child: SvgPicture.asset("assets/icons/trash.svg"),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getActionItem({
    required String title,
    required Widget endContent,
  }) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 4,
          horizontal: 8,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: AppColors.greyColor.withOpacity(.5),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontFamily: "SM",
                fontSize: 12,
                color: AppColors.greyColor,
              ),
              textDirection: TextDirection.rtl,
            ),
            const SizedBox(
              width: 8,
            ),
            endContent,
          ],
        ),
      ),
    );
  }

  Widget _getVariantItem({required Widget endContent}) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 4,
          horizontal: 8,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: AppColors.greyColor.withOpacity(.5),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset("assets/icons/arrow_up_down.svg"),
            const SizedBox(
              width: 8,
            ),
            endContent,
          ],
        ),
      ),
    );
  }
}
