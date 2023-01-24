import 'package:apple_shop/config/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String labelText;
  final bool isPassword;
  final String? errorText;

  const AppTextField({
    super.key,
    this.controller,
    required this.labelText,
    required this.isPassword,
    this.errorText,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: widget.isPassword ? !passwordVisible : false,
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
        labelText: widget.labelText,
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
        errorText: widget.errorText,
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  passwordVisible ? Icons.visibility : Icons.visibility_off,
                  color: Colors.black45,
                ),
                onPressed: () {
                  setState(() {
                    passwordVisible = !passwordVisible;
                  });
                },
              )
            : null,
      ),
    );
  }
}
