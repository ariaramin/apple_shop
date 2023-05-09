import 'package:apple_shop/di/di.dart';
import 'package:apple_shop/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:apple_shop/features/cart/presentation/widgets/cart_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: locator.get<CartBloc>(),
      child: const Scaffold(
        body: SafeArea(
          child: CartBody(),
        ),
      ),
    );
  }
}
