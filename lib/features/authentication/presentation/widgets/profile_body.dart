import 'package:apple_shop/config/theme/app_colors.dart';
import 'package:apple_shop/config/component/custom_appbar.dart';
import 'package:apple_shop/features/authentication/presentation/widgets/profile_options.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(
          title: "حساب کاربری",
          centerTitle: true,
          titleColor: AppColors.primaryColor,
          leadingIcon: SvgPicture.asset(
            "assets/icons/apple.svg",
            color: AppColors.primaryColor,
          ),
          visibleEndIcon: false,
        ),
        const Text(
          "آریا رامین",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        const Text(
          "09123456789",
          style: TextStyle(
            fontSize: 10,
            color: AppColors.greyColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const ProfileOptions(),
      ],
    );
  }
}
