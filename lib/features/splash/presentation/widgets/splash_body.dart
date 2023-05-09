import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashBody extends StatelessWidget {
  const SplashBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xff58AEE8),
            Color(0xff3B5EDF),
          ],
          begin: AlignmentDirectional.topStart,
          end: AlignmentDirectional.bottomEnd,
        ),
      ),
      child: Column(
        children: [
          const SizedBox(
            width: double.infinity,
          ),
          const SizedBox(
            height: 86,
          ),
          Expanded(
            child: SvgPicture.asset("assets/icons/circle.svg"),
          ),
          const SizedBox(
            height: 32,
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/pattern.png"),
                  repeat: ImageRepeat.repeat,
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  SizedBox(
                    width: double.infinity,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 28,
                      vertical: 12,
                    ),
                    child: Text(
                      "اوج هـیـجـان \nبا خرید محصولات\n اپل!",
                      style: TextStyle(
                        fontSize: 32,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.start,
                      textDirection: TextDirection.rtl,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
