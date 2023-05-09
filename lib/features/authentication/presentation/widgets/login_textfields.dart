import 'package:apple_shop/config/component/app_textfield.dart';
import 'package:apple_shop/config/utility/failure.dart';
import 'package:apple_shop/features/authentication/presentation/bloc/auth_state.dart';
import 'package:flutter/material.dart';

class LoginTextFields extends StatelessWidget {
  final AuthState state;
  final TextEditingController usernameConroller;
  final TextEditingController passwordConroller;

  const LoginTextFields({
    super.key,
    required this.state,
    required this.usernameConroller,
    required this.passwordConroller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppTextField(
          controller: usernameConroller,
          labelText: "نام کاربری",
          isPassword: false,
          errorText: _getUsernameError(state),
        ),
        const SizedBox(
          height: 18,
        ),
        AppTextField(
          controller: passwordConroller,
          labelText: "رمز عبور",
          isPassword: true,
          errorText: _getPasswordError(state),
        ),
      ],
    );
  }

  String? _getUsernameError(AuthState state) {
    if (state is AuthResponseState) {
      return state.response.fold((failure) {
        var authFailure = failure as AuthFailure;
        return authFailure.error?["identity"] != null
            ? authFailure.error!["identity"]["message"]
            : null;
      }, (r) => null);
    }
    return null;
  }

  String? _getPasswordError(AuthState state) {
    if (state is AuthResponseState) {
      return state.response.fold((failure) {
        var authFailure = failure as AuthFailure;
        return authFailure.error?["password"] != null
            ? authFailure.error!["password"]["message"]
            : null;
      }, (r) => null);
    }
    return null;
  }
}
