import 'package:apple_shop/config/theme/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final Color titleColor;
  final bool centerTitle;
  final Widget leadingIcon;
  final Widget? endIcon;
  final VoidCallback? endIconOnPressed;
  final bool visibleEndIcon;

  const CustomAppBar({
    super.key,
    required this.title,
    this.titleColor = AppColors.greyColor,
    required this.leadingIcon,
    this.endIcon,
    this.endIconOnPressed,
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
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Visibility(
                visible: visibleEndIcon,
                child: GestureDetector(
                  onTap: endIconOnPressed,
                  child: SizedBox(
                    width: 24,
                    child: endIcon,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    color: titleColor,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: centerTitle ? TextAlign.center : TextAlign.start,
                ),
              ),
              SizedBox(
                width: 24,
                child: leadingIcon,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
