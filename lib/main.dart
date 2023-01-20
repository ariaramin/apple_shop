import 'package:apple_shop/di/di.dart';
import 'package:apple_shop/ui/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() async {
  await getItInit();
  runApp(const Application());
}

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
