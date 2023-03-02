import 'package:apple_shop/config/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CommentImageList extends StatelessWidget {
  const CommentImageList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
}
