import 'package:apple_shop/features/category/presentation/bloc/category_bloc.dart';
import 'package:apple_shop/features/category/presentation/widgets/category_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryBloc(),
      child: const Scaffold(
        body: SafeArea(
          child: CategoryBody(),
        ),
      ),
    );
  }
}
