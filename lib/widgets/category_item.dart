import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 56,
          width: 56,
          decoration: ShapeDecoration(
            color: const Color(0xffFBAD40),
            shadows: const [
              BoxShadow(
                color: Color(0xffFBAD40),
                blurRadius: 25,
                spreadRadius: -12,
                offset: Offset(0.0, 15),
              )
            ],
            shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(48),
            ),
          ),
          child: Center(
            child: SizedBox(
              width: 22,
              child: SvgPicture.asset("assets/icons/phone.svg"),
            ),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        const Text(
          'آیفون',
          style: TextStyle(
            fontFamily: 'SB',
            fontSize: 12,
          ),
        )
      ],
    );
  }
}
