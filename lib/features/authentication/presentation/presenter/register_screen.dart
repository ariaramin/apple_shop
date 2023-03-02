import 'package:apple_shop/config/component/app_button.dart';
import 'package:apple_shop/config/component/app_textfield.dart';
import 'package:apple_shop/config/route/app_route_name.dart';
import 'package:apple_shop/config/theme/app_colors.dart';
import 'package:apple_shop/config/utility/failure.dart';
import 'package:apple_shop/features/authentication/presentation/bloc/auth_bloc.dart';
import 'package:apple_shop/features/authentication/presentation/bloc/auth_event.dart';
import 'package:apple_shop/features/authentication/presentation/bloc/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegisterScreen extends StatelessWidget {
  final TextEditingController _usernameConroller = TextEditingController();
  final TextEditingController _passwordConroller = TextEditingController();
  final TextEditingController _confirmPasswordConroller =
      TextEditingController();

  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: _getContent(context),
      ),
    );
  }

  Widget _getContent(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xff58AEE8),
            Color(0xff3B5EDF),
          ],
          begin: AlignmentDirectional.topStart,
          end: AlignmentDirectional.bottomEnd,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          children: [
            const SizedBox(
              height: 16,
            ),
            _getForm(),
          ],
        ),
      ),
    );
  }

  Widget _getForm() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      padding: const EdgeInsets.all(16),
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          return Column(
            children: [
              const Text(
                "به اپل شاپ خوش آمدید",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              Directionality(
                textDirection: TextDirection.rtl,
                child: _getInputs(context, state),
              ),
              const SizedBox(
                height: 16,
              ),
              state is AuthResponseState
                  ? state.response.fold(
                      (failure) => Text(
                            failure.message ?? "ثبت نام ناموفق بود.",
                            style: const TextStyle(
                              fontSize: 12,
                              color: AppColors.redColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                      (r) => const SizedBox())
                  : const SizedBox(),
              const SizedBox(
                height: 16,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(AppRouteName.login);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "ورود",
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      "حساب کاربری دارید؟",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              AppButton(
                onPressed: () {
                  BlocProvider.of<AuthBloc>(context).add(
                    RegisterRequest(
                      _usernameConroller.text,
                      _passwordConroller.text,
                      _confirmPasswordConroller.text,
                    ),
                  );
                },
                isLoading: state is AuthLoadingState ? true : false,
                text: "ثبت نام",
              )
            ],
          );
        },
      ),
    );
  }

  Widget _getInputs(BuildContext context, AuthState state) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppTextField(
          controller: _usernameConroller,
          labelText: "نام کاربری",
          isPassword: false,
          errorText: _getUsernameError(state),
        ),
        const SizedBox(
          height: 18,
        ),
        AppTextField(
          controller: _passwordConroller,
          labelText: "رمز عبور",
          isPassword: true,
          errorText: _getPasswordError(state),
        ),
        const SizedBox(
          height: 18,
        ),
        AppTextField(
          controller: _confirmPasswordConroller,
          labelText: "تایید رمز عبور",
          isPassword: true,
          errorText: _getConfirmPasswordError(state),
        ),
      ],
    );
  }

  String? _getUsernameError(AuthState state) {
    if (state is AuthResponseState) {
      return state.response.fold((failure) {
        var authFailure = failure as AuthFailure;
        if (_usernameConroller.text.isEmpty) {
          return "Cannot be blank.";
        }
        return authFailure.error?["username"] != null
            ? authFailure.error!["username"]["message"]
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

  String? _getConfirmPasswordError(AuthState state) {
    if (state is AuthResponseState) {
      return state.response.fold((failure) {
        var authFailure = failure as AuthFailure;
        return authFailure.error?["passwordConfirm"] != null
            ? authFailure.error!["passwordConfirm"]["message"]
            : null;
      }, (r) => null);
    }
    return null;
  }
}
