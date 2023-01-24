import 'package:apple_shop/config/route/app_route.dart';
import 'package:apple_shop/config/route/app_route_name.dart';
import 'package:apple_shop/config/theme/app_theme.dart';
import 'package:apple_shop/di/di.dart';
import 'package:flutter/material.dart';

void main() async {
  await getItInit();
  runApp(const Application());
}

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      themeMode: ThemeMode.light,
      initialRoute: AppRouteName.login,
      onGenerateRoute: (settings) => AppRoute.generate(settings),
    );
  }
}
