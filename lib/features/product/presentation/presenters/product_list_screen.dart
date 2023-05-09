import 'package:apple_shop/features/product/presentation/arguments/product_list_arguments.dart';
import 'package:apple_shop/features/product/presentation/bloc/product_bloc.dart';
import 'package:apple_shop/features/product/presentation/widgets/product_list_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductListScreen extends StatelessWidget {
  final ProductListArguments arguments;
  const ProductListScreen({
    super.key,
    required this.arguments,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductBloc(),
      child: Scaffold(
        body: SafeArea(
          child: ProductListBody(arguments: arguments),
        ),
      ),
    );
  }
}
