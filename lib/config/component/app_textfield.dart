import 'package:apple_shop/config/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String labelText;
  final String? errorText;
  const AppTextField({
    super.key,
    this.controller,
    required this.labelText,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            width: 2,
            color: Colors.black.withOpacity(.2),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            width: 2,
            color: Colors.black,
          ),
        ),
        labelText: labelText,
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            width: 2,
            color: AppColors.redColor.withOpacity(.7),
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            width: 2,
            color: AppColors.redColor,
          ),
        ),
        errorStyle: const TextStyle(
          color: AppColors.redColor,
        ),
        errorText: errorText,
        floatingLabelStyle: Theme.of(context)
            .textTheme
            .titleLarge
            ?.copyWith(color: AppColors.primaryColor),
      ),
    );
  }
}
