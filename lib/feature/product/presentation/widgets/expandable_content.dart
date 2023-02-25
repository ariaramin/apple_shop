import 'package:apple_shop/config/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class ExpandableContent extends StatelessWidget {
  final String? text;

  const ExpandableContent({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 14,
        right: 14,
        top: 8,
      ),
      child: Container(
        // height: 46,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            width: 1,
            color: AppColors.greyColor,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: ReadMoreText(
            text == null || text!.isEmpty
                ? "متنی برای نمایش وجود ندارد."
                : text!,
            trimLines: 4,
            textScaleFactor: 1,
            colorClickableText: AppColors.primaryColor,
            trimMode: TrimMode.Line,
            trimCollapsedText: 'نمایش بیشتر',
            trimExpandedText: 'نمایش کمتر',
            // textAlign: TextAlign.justify,
            textDirection: TextDirection.rtl,
            moreStyle: const TextStyle(
              color: AppColors.primaryColor,
            ),
            lessStyle: const TextStyle(
              color: AppColors.primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
