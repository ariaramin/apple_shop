import 'package:apple_shop/di/di.dart';
import 'package:apple_shop/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:apple_shop/features/product/presentation/arguments/product_arguments.dart';
import 'package:apple_shop/features/product/presentation/bloc/product_bloc.dart';
import 'package:apple_shop/features/product/presentation/widgets/product_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatelessWidget {
  final ProductArguments arguments;

  const ProductScreen({
    super.key,
    required this.arguments,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductBloc>(
          create: (BuildContext context) => ProductBloc(),
        ),
        BlocProvider<CartBloc>.value(value: locator.get<CartBloc>())
      ],
      child: Scaffold(
        body: SafeArea(
          child: ProductBody(arguments: arguments),
        ),
      ),
    );
  }
}
