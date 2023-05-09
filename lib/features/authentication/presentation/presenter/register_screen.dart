import 'package:apple_shop/features/authentication/presentation/bloc/auth_bloc.dart';
import 'package:apple_shop/features/authentication/presentation/widgets/register_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: RegisterBody(),
        ),
      ),
    );
  }
}
