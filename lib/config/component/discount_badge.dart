import 'package:apple_shop/config/theme/app_colors.dart';
import 'package:flutter/material.dart';

class DiscountBadge extends StatelessWidget {
  final int percent;

  const DiscountBadge({
    super.key,
    required this.percent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.redColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 2,
          horizontal: 8,
        ),
        child: Text(
          '٪ $percent',
          style: const TextStyle(
            fontSize: 12,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
