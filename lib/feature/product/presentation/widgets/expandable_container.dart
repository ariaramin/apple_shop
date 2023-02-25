import 'package:apple_shop/config/theme/app_colors.dart';
import 'package:apple_shop/feature/product/presentation/widgets/expandable_content.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

class ExpandableContainer extends StatefulWidget {
  final String title;
  final Widget? centerWidget;
  final String? text;

  const ExpandableContainer({
    super.key,
    required this.title,
    this.centerWidget,
    this.text,
  });

  @override
  State<ExpandableContainer> createState() => _ExpandableContainerState();
}

class _ExpandableContainerState extends State<ExpandableContainer> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 14,
            right: 14,
            top: 20,
          ),
          child: GestureDetector(
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            child: Container(
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
                        RotatedBox(
                          quarterTurns: _isExpanded ? -1 : 0,
                          child: SizedBox(
                            width: 20,
                            child:
                                SvgPicture.asset("assets/icons/arrow-left.svg"),
                          ),
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
                    widget.centerWidget ?? Container(),
                    const SizedBox(
                      width: 6,
                    ),
                    Text(
                      widget.title,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                      textDirection: TextDirection.rtl,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Visibility(
          visible: _isExpanded,
          child: ExpandableContent(
            text: widget.text,
          ),
        ),
      ],
    );
  }
}
