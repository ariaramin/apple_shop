import 'package:apple_shop/config/theme/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

class ExpandableContainer extends StatelessWidget {
  final String title;
  final Widget? centerWidget;

  const ExpandableContainer({
    super.key,
    required this.title,
    this.centerWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 14,
        right: 14,
        top: 20,
      ),
      child: Container(
        height: 46,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            width: 1,
            color: AppColors.greyColor,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 20,
                    child: SvgPicture.asset("assets/icons/arrow-left.svg"),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  const Text(
                    "مشاهده",
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              centerWidget ?? Container(),
              const SizedBox(
                width: 6,
              ),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
                textDirection: TextDirection.rtl,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
