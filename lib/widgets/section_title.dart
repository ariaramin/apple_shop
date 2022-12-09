import 'package:apple_shop/constants/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  String title;
  bool isLeadingVisible;

  SectionTitle({
    super.key,
    required this.title,
    required this.isLeadingVisible,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Visibility(
          visible: isLeadingVisible,
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
