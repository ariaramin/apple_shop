import 'package:apple_shop/config/route/app_route_name.dart';
import 'package:apple_shop/config/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final bool visibleLeadingText;
  final VoidCallback? leadingTextOnTap;

  const SectionTitle({
    Key? key,
    required this.title,
    required this.visibleLeadingText,
    this.leadingTextOnTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Visibility(
            visible: visibleLeadingText,
            child: GestureDetector(
              onTap: leadingTextOnTap,
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
              fontSize: 14,
              color: AppColors.greyColor,
            ),
          ),
        ],
      ),
    );
  }
}
