import 'dart:ui';
import 'package:apple_shop/config/component/custom_appbar.dart';
import 'package:apple_shop/config/theme/app_colors.dart';
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
      body: SafeArea(
        child: _getContent(),
      ),
    );
  }

  Widget _getContent() {
    return CustomScrollView(
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
            endIcon: SvgPicture.asset(
              "assets/icons/arrow-right.svg",
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            endIconOnPressed: () {
              Navigator.pop(context);
            },
            visibleEndIcon: true,
          ),
        ),
        const SliverPadding(
          padding: EdgeInsets.only(bottom: 22),
          sliver: SliverToBoxAdapter(
            child: Text(
              "آیفون SE 2022",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
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
        SliverPadding(
          padding: const EdgeInsets.only(
            left: 14,
            right: 14,
            top: 20,
          ),
          sliver: SliverToBoxAdapter(
            child: _getExpandableTitle("مشخصات فنی:"),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.only(
            left: 14,
            right: 14,
            top: 20,
          ),
          sliver: SliverToBoxAdapter(
            child: _getExpandableTitle("توضیحات محصول:"),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.only(
            left: 14,
            right: 14,
            top: 20,
          ),
          sliver: SliverToBoxAdapter(
            child: _getExpandableTitle(
              "نظرات کاربران:",
              center: _getCommentImageList(),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.only(
            left: 14,
            right: 14,
            bottom: 38,
            top: 42,
          ),
          sliver: SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(child: _getPriceContainer()),
                const SizedBox(
                  width: 18,
                ),
                Expanded(child: _getAddToCardButton()),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _getPriceContainer() {
    return SizedBox(
      height: 72,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              height: 54,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: AppColors.greenColor,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  height: 58,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: AppColors.greenColor.withOpacity(.3),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'تومان',
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            '۴۹،۸۰۰،۰۰۰',
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.white,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                          Text(
                            '۴۸،۸۰۰،۰۰۰',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Container(
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
                              fontSize: 10,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getAddToCardButton() {
    return SizedBox(
      height: 72,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              height: 56,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: AppColors.primaryColor,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  height: 58,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: AppColors.primaryColor.withOpacity(.3),
                  ),
                  child: const Center(
                    child: Text(
                      "افزودن به سبد خرید",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getCommentImageList() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 28,
          height: 28,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              width: 2,
              color: Colors.white,
            ),
            image: const DecorationImage(
              image: AssetImage("assets/images/user.png"),
            ),
          ),
        ),
        Positioned(
          right: 15,
          child: Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              color: Colors.pink,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                width: 2,
                color: Colors.white,
              ),
              image: const DecorationImage(
                image: AssetImage("assets/images/user.png"),
              ),
            ),
          ),
        ),
        Positioned(
          right: 30,
          child: Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                width: 2,
                color: Colors.white,
              ),
              image: const DecorationImage(
                image: AssetImage("assets/images/user.png"),
              ),
            ),
          ),
        ),
        Positioned(
          right: 45,
          child: Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                width: 2,
                color: Colors.white,
              ),
              image: const DecorationImage(
                image: AssetImage("assets/images/user.png"),
              ),
            ),
          ),
        ),
        Positioned(
          right: 60,
          child: Container(
            margin: const EdgeInsets.only(left: 10),
            height: 28,
            width: 28,
            decoration: BoxDecoration(
              color: AppColors.greyColor,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                width: 2,
                color: Colors.white,
              ),
            ),
            child: const Center(
              child: Text(
                '+۱۰',
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _getExpandableTitle(String title, {Widget? center}) {
    return Container(
      height: 46,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          width: 1,
          color: AppColors.greyColor,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 20,
                  child: SvgPicture.asset("assets/icons/arrow-left.svg"),
                ),
                const SizedBox(
                  width: 8,
                ),
                const Text(
                  "مشاهده",
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const Spacer(),
            center ?? Container(),
            const SizedBox(
              width: 6,
            ),
            Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
              textDirection: TextDirection.rtl,
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
            fontSize: 12,
            fontWeight: FontWeight.bold,
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
          color: Theme.of(context).colorScheme.primaryContainer,
        ),
        duration: const Duration(milliseconds: 300),
        child: const Center(
          child: Text(
            "۱۲۸",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _getColorList() {
    var colors = [
      ["مشکی", Colors.black],
      ["سبز", Colors.green[900]],
      ["آبی", Colors.blue[900]]
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Text(
          "انتخاب رنگ",
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
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
              itemCount: colors.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: _getColorItem(index, colors[index]),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _getColorItem(
    int index,
    List<Object?> color,
  ) {
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
          color: color[1] as Color,
        ),
        duration: const Duration(milliseconds: 300),
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Positioned(
              right: 36,
              child: Text(
                color[0] as String,
                style: const TextStyle(
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
                  color: color[1] as Color,
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
        color: Theme.of(context).colorScheme.primaryContainer,
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
                  child: SvgPicture.asset(
                    "assets/icons/like.svg",
                    width: 26,
                  ),
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
