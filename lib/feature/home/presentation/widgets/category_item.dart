import 'package:apple_shop/config/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoryItem extends StatelessWidget {
  Color color;
  Widget icon;
  String title;
  CategoryItem({
    super.key,
    this.color = AppColors.primaryColor,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 56,
          width: 56,
          decoration: ShapeDecoration(
            color: color,
            shadows: [
              BoxShadow(
                color: color,
                blurRadius: 25,
                spreadRadius: -12,
                offset: const Offset(0.0, 15),
              )
            ],
            shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(48),
            ),
          ),
          child: Center(
            child: SizedBox(
              width: 22,
              child: icon,
            ),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          title,
          style: const TextStyle(fontSize: 12),
        )
      ],
    );
  }
}
