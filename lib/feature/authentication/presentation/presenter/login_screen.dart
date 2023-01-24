import 'package:apple_shop/config/component/app_button.dart';
import 'package:apple_shop/config/component/app_textfield.dart';
import 'package:apple_shop/config/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: _getContent(context),
    );
  }

  Widget _getContent(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xff58AEE8),
            Color(0xff3B5EDF),
          ],
          begin: AlignmentDirectional.topStart,
          end: AlignmentDirectional.bottomEnd,
        ),
      ),
      child: Stack(
        children: [
          Column(
            children: [
              const SizedBox(
                height: 56,
              ),
              Expanded(
                child: SvgPicture.asset("assets/icons/circle.svg"),
              ),
              Expanded(
                child: Container(),
              ),
            ],
          ),
          Positioned(
            bottom: MediaQuery.of(context).viewInsets.bottom == 0
                ? 26
                : MediaQuery.of(context).viewInsets.bottom,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Container(
                height: 248,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: _getInputs(context),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    AppButton(
                      onPressed: () {},
                      text: "ورود به حساب کاربری",
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _getInputs(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppTextField(
          labelText: "نام کاربری",
          isPassword: false,
        ),
        const SizedBox(
          height: 18,
        ),
        AppTextField(
          labelText: "رمز عبور",
          isPassword: true,
        ),
      ],
    );
  }
}
