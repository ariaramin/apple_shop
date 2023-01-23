import 'package:apple_shop/config/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BannerSlider extends StatelessWidget {
  BannerSlider({super.key});

  final _controller = PageController(
    viewportFraction: 0.9,
  );

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        SizedBox(
          height: 168,
          child: PageView.builder(
            controller: _controller,
            itemCount: 3,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: const DecorationImage(
                    image: AssetImage(
                      "assets/images/banner1.png",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),
        Positioned(
          bottom: 10,
          child: SmoothPageIndicator(
            controller: _controller,
            count: 3,
            effect: const ExpandingDotsEffect(
              expansionFactor: 3,
              dotHeight: 8,
              dotWidth: 8,
              dotColor: Colors.white,
              activeDotColor: AppColors.primaryColor,
            ),
          ),
        )
      ],
    );
  }
}
