import 'package:apple_shop/config/route/app_route.dart';
import 'package:apple_shop/config/route/app_route_name.dart';
import 'package:apple_shop/config/theme/app_theme.dart';
import 'package:apple_shop/di/di.dart';
import 'package:apple_shop/features/cart/domain/entities/cart_item_model.dart';
import 'package:apple_shop/features/product/data/models/variant.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter<Variant>(VariantAdapter());
  Hive.registerAdapter<CartItemModel>(CartItemModelAdapter());
  await Hive.openBox<CartItemModel>("cart");
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
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.light,
      initialRoute: AppRouteName.splash,
      onGenerateRoute: (settings) => AppRoute.generate(settings),
    );
  }
}
