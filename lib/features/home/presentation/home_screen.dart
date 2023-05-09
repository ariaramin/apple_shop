import 'package:apple_shop/features/home/presentation/bloc/home_bloc.dart';
import 'package:apple_shop/features/home/presentation/widgets/home_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: const Scaffold(
        body: SafeArea(
          child: HomeBody(),
        ),
      ),
    );
  }
}
