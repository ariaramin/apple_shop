import 'package:apple_shop/core/theme/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  String title;
  Color titleColor;
  bool centerTitle;
  Widget leadingIcon;
  Widget? endIcon;
  bool visibleEndIcon;
  CustomAppBar({
    super.key,
    required this.title,
    this.titleColor = AppColors.greyColor,
    required this.leadingIcon,
    this.endIcon,
    required this.centerTitle,
    required this.visibleEndIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 24,
        right: 24,
        bottom: 32,
        top: 18,
      ),
      child: Container(
        height: 46,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              SizedBox(
                width: 24,
                child: leadingIcon,
              ),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontFamily: "SB",
                    fontSize: 16,
                    color: titleColor,
                  ),
                  textAlign: centerTitle ? TextAlign.center : TextAlign.end,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Visibility(
                visible: visibleEndIcon,
                child: SizedBox(
                  width: 24,
                  child: endIcon,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
