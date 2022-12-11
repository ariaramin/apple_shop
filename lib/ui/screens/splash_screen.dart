import 'package:apple_shop/ui/screens/main_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(milliseconds: 1800),
      () {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => const MainScreen(),
          ),
          (route) => false,
        );
      },
    );
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: _getContent(),
    );
  }

  Widget _getContent() {
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
                        fontFamily: "SB",
                        fontSize: 32,
                        color: Colors.white,
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
