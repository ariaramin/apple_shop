import 'package:apple_shop/constants/app_colors.dart';
import 'package:apple_shop/widgets/custom_appbar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  int _selectedColorIndex = 0;
  int _selectedSpaceIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: CustomAppBar(
                title: "آیفون",
                centerTitle: true,
                titleColor: AppColors.primaryColor,
                leadingIcon: SvgPicture.asset(
                  "assets/icons/apple.svg",
                  color: AppColors.primaryColor,
                ),
                endIcon: SvgPicture.asset("assets/icons/arrow-right.svg"),
                visibleEndIcon: true,
              ),
            ),
            const SliverPadding(
              padding: EdgeInsets.only(bottom: 22),
              sliver: SliverToBoxAdapter(
                child: Text(
                  "آیفون SE 2022",
                  style: TextStyle(
                    fontFamily: "SB",
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.rtl,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: _getImageContainer(),
            ),
            SliverPadding(
              padding: const EdgeInsets.only(
                left: 14,
                right: 14,
                top: 20,
              ),
              sliver: SliverToBoxAdapter(
                child: _getColorList(),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.only(
                left: 14,
                right: 14,
                top: 20,
              ),
              sliver: SliverToBoxAdapter(
                child: _getSpaceList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getSpaceList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Text(
          "انتخاب حافظه داخلی",
          style: TextStyle(
            fontFamily: "SB",
            fontSize: 12,
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        SizedBox(
          height: 28,
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: _getSpaceItem(index),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _getSpaceItem(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedSpaceIndex = index;
        });
      },
      child: AnimatedContainer(
        width: 78,
        height: 28,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            width: _selectedSpaceIndex == index ? 2 : 1,
            color: _selectedSpaceIndex == index
                ? AppColors.primaryColor
                : AppColors.greyColor,
          ),
          color: Colors.white,
        ),
        duration: const Duration(milliseconds: 300),
        child: const Center(
          child: Text(
            "۱۲۸",
            style: TextStyle(
              fontFamily: "SB",
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }

  Widget _getColorList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Text(
          "انتخاب رنگ",
          style: TextStyle(
            fontFamily: "SB",
            fontSize: 12,
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        SizedBox(
          height: 28,
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: _getColorItem(index),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _getColorItem(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedColorIndex = index;
        });
      },
      child: AnimatedContainer(
        width: _selectedColorIndex == index ? 78 : 28,
        height: 28,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.black,
        ),
        duration: const Duration(milliseconds: 300),
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            const Positioned(
              left: 12,
              child: Text(
                "مشکی",
                style: TextStyle(
                  fontFamily: "SM",
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
            ),
            Positioned(
              right: 0,
              child: Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    width: 1,
                    color: AppColors.greyColor,
                  ),
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getImageContainer() {
    return Container(
      height: 296,
      margin: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          const SizedBox(width: double.infinity),
          Expanded(
            child: Stack(
              alignment: AlignmentDirectional.center,
              fit: StackFit.expand,
              children: [
                Positioned(
                  top: 10,
                  left: 10,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset("assets/icons/star.svg"),
                      const SizedBox(
                        width: 4,
                      ),
                      const Text(
                        "۴.۵",
                        style: TextStyle(
                          fontFamily: "SM",
                          fontSize: 12,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: double.infinity,
                  child: Image.asset("assets/images/iphone-se.png"),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: SvgPicture.asset("assets/icons/like.svg"),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Wrap(
            spacing: 14,
            children: [
              _imageItem(),
              _imageItem(),
              _imageItem(),
              _imageItem(),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
        ],
      ),
    );
  }

  Widget _imageItem() {
    return Container(
      width: 74,
      height: 74,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          width: 1,
          color: AppColors.greyColor,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset("assets/images/iphone-se.png"),
      ),
    );
  }
}
