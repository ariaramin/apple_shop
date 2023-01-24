import 'package:apple_shop/config/route/app_route_name.dart';
import 'package:apple_shop/feature/authentication/presentation/presenter/login_screen.dart';
import 'package:apple_shop/feature/base/presentation/base_screen.dart';
import 'package:apple_shop/feature/product/presentation/presenter/product_list_screen.dart';
import 'package:apple_shop/feature/product/presentation/presenter/product_screen.dart';
import 'package:apple_shop/feature/splash/presentation/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRoute {
  static generate(RouteSettings settings) {
    switch (settings.name) {
      case AppRouteName.base:
        return MaterialPageRoute(
          builder: (context) => const BaseScreen(),
          settings: settings,
        );
      case AppRouteName.splash:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
          settings: settings,
        );
      case AppRouteName.login:
        return MaterialPageRoute(
          builder: (context) => const LoginScreen(),
          settings: settings,
        );
      // case AppRouteName.home:
      //   return MaterialPageRoute(
      //     builder: (context) => const HomeScreen(),
      //     settings: settings,
      //   );
      // case AppRouteName.category:
      //   return MaterialPageRoute(
      //     builder: (context) => const CategoryScreen(),
      //     settings: settings,
      //   );
      // case AppRouteName.cart:
      //   return MaterialPageRoute(
      //     builder: (context) => const CartScreen(),
      //     settings: settings,
      //   );
      // case AppRouteName.profile:
      //   return MaterialPageRoute(
      //     builder: (context) => const ProfileScreen(),
      //     settings: settings,
      //   );
      case AppRouteName.product:
        return MaterialPageRoute(
          builder: (context) => const ProductScreen(),
          settings: settings,
        );
      case AppRouteName.productList:
        return MaterialPageRoute(
          builder: (context) => ProductListScreen(settings.arguments as String),
          settings: settings,
        );
    }
  }
}
