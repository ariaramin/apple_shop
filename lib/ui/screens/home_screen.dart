import 'package:apple_shop/constants/app_colors.dart';
import 'package:apple_shop/widgets/banner_slider.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: BannerSlider(),
            ),
          ],
        ),
      ),
    );
  }
}
