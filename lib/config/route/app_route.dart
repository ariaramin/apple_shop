import 'package:apple_shop/config/route/app_route_name.dart';
import 'package:apple_shop/features/authentication/presentation/presenter/login_screen.dart';
import 'package:apple_shop/features/authentication/presentation/presenter/register_screen.dart';
import 'package:apple_shop/features/base/presentation/base_screen.dart';
import 'package:apple_shop/features/product/presentation/arguments/product_arguments.dart';
import 'package:apple_shop/features/product/presentation/arguments/product_list_arguments.dart';
import 'package:apple_shop/features/product/presentation/presenters/product_list_screen.dart';
import 'package:apple_shop/features/product/presentation/presenters/product_screen.dart';
import 'package:apple_shop/features/search/presentation/search_screen.dart';
import 'package:apple_shop/features/splash/presentation/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRoute {
  static generate(RouteSettings settings) {
    switch (settings.name) {
      case AppRouteName.base:
        return MaterialPageRoute(
          builder: (context) => const Directionality(
            textDirection: TextDirection.rtl,
            child: BaseScreen(),
          ),
          settings: settings,
        );
      case AppRouteName.splash:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
          settings: settings,
        );
      case AppRouteName.login:
        return MaterialPageRoute(
          builder: (context) => const Directionality(
            textDirection: TextDirection.rtl,
            child: LoginScreen(),
          ),
          settings: settings,
        );
      case AppRouteName.register:
        return MaterialPageRoute(
          builder: (context) => const Directionality(
            textDirection: TextDirection.rtl,
            child: RegisterScreen(),
          ),
          settings: settings,
        );
      case AppRouteName.search:
        return MaterialPageRoute(
          builder: (context) => const Directionality(
            textDirection: TextDirection.rtl,
            child: SearchScreen(),
          ),
          settings: settings,
        );
      case AppRouteName.product:
        return MaterialPageRoute(
          builder: (context) => Directionality(
            textDirection: TextDirection.rtl,
            child: ProductScreen(
              arguments: settings.arguments as ProductArguments,
            ),
          ),
          settings: settings,
        );
      case AppRouteName.productList:
        return MaterialPageRoute(
          builder: (context) => Directionality(
            textDirection: TextDirection.rtl,
            child: ProductListScreen(
              arguments: settings.arguments as ProductListArguments,
            ),
          ),
          settings: settings,
        );
    }
  }
}
