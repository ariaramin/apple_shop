import 'package:apple_shop/config/route/app_route_name.dart';
import 'package:apple_shop/config/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(AppRouteName.product);
      },
      child: Container(
        width: 178,
        height: 216,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 12,
            ),
            Expanded(child: _getItemImage()),
            // const Spacer(),
            _getBottomSection(),
          ],
        ),
      ),
    );
  }

  Widget _getItemImage() {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Container(),
        Positioned(
          top: 0,
          right: 10,
          child: SizedBox(
            width: 22,
            child: SvgPicture.asset(
              "assets/icons/like-filled.svg",
            ),
          ),
        ),
        Image.asset("assets/images/iphone-13.png"),
        Positioned(
          bottom: 0,
          left: 10,
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.redColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(
                vertical: 2,
                horizontal: 8,
              ),
              child: Text(
                '٪۳',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _getBottomSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Padding(
          padding: EdgeInsets.only(
            bottom: 10,
            right: 10,
          ),
          child: Text(
            "آیفون ۱۳ پرومکس",
            style: TextStyle(
              fontSize: 14,
            ),
          ),
        ),
        Container(
          height: 54,
          decoration: const BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.primaryColor,
                blurRadius: 25,
                spreadRadius: -12,
                offset: Offset(0, 16),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                const Text(
                  'تومان',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      '۴۹،۸۰۰،۰۰۰',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    Text(
                      '۴۸،۸۰۰،۰۰۰',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                SizedBox(
                  width: 24,
                  child: SvgPicture.asset(
                    'assets/icons/arrow-right-filled.svg',
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
