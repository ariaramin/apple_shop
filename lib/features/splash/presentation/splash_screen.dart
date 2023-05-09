import 'package:apple_shop/config/route/app_route_name.dart';
import 'package:apple_shop/features/splash/presentation/widgets/splash_body.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(milliseconds: 1800),
      () {
        Navigator.of(context).pushNamedAndRemoveUntil(
          AppRouteName.base,
          (route) => false,
        );
      },
    );
    return const Scaffold(
      backgroundColor: Colors.transparent,
      body: SplashBody(),
    );
  }
}
