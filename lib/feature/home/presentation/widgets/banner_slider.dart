import 'package:apple_shop/config/component/cashed_image.dart';
import 'package:apple_shop/config/theme/app_colors.dart';
import 'package:apple_shop/feature/home/data/model/banner.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BannerSlider extends StatefulWidget {
  final List<BannerModel> bannerList;

  const BannerSlider({
    super.key,
    required this.bannerList,
  });

  @override
  State<BannerSlider> createState() => _BannerSliderState();
}

class _BannerSliderState extends State<BannerSlider> {
  var _activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        CarouselSlider.builder(
          itemCount: widget.bannerList.length,
          options: CarouselOptions(
            aspectRatio: 2.4 / 1,
            enlargeCenterPage: true,
            enlargeFactor: .15,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            scrollDirection: Axis.horizontal,
            onPageChanged: (index, reason) {
              setState(() {
                _activeIndex = index;
              });
            },
          ),
          itemBuilder: (context, index, realIndex) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: CachedImage(
                  imageUrl: widget.bannerList[index].thumbnail,
                ),
              ),
            );
          },
        ),
        Positioned(
          bottom: 8,
          child: AnimatedSmoothIndicator(
            count: widget.bannerList.length,
            activeIndex: _activeIndex,
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
