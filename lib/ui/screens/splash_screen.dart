import 'package:flutter_svg/flutter_svg.dart';
// import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
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
            Expanded(
              child: _getLogo(),
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
      ),
    );
  }

  Widget _getLogo() {
    return Padding(
      padding: const EdgeInsets.only(
        // left: 32,
        // right: 32,
        top: 82,
        // bottom: 32,
      ),
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          SvgPicture.asset("assets/icons/circle.svg"),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 76,
                child: SvgPicture.asset("assets/icons/apple.svg"),
              ),
              const SizedBox(
                height: 4,
              ),
              const Text(
                "اپل شاپ",
                style: TextStyle(
                  fontFamily: "SB",
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
