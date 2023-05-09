import 'package:apple_shop/config/component/app_button.dart';
import 'package:apple_shop/config/route/app_route_name.dart';
import 'package:apple_shop/config/theme/app_colors.dart';
import 'package:apple_shop/features/authentication/presentation/bloc/auth_bloc.dart';
import 'package:apple_shop/features/authentication/presentation/bloc/auth_event.dart';
import 'package:apple_shop/features/authentication/presentation/bloc/auth_state.dart';
import 'package:apple_shop/features/authentication/presentation/widgets/login_textfields.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginBody extends StatelessWidget {
  final TextEditingController _usernameConroller = TextEditingController();
  final TextEditingController _passwordConroller = TextEditingController();

  LoginBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
            Container(
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
                        child: LoginTextFields(
                          state: state,
                          usernameConroller: _usernameConroller,
                          passwordConroller: _passwordConroller,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      state is AuthResponseState
                          ? state.response.fold(
                              (failure) => Text(
                                    failure.message ?? "احراز هویت ناموفق بود",
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
                          Navigator.of(context)
                              .pushNamed(AppRouteName.register);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              "ثبت نام",
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
                              "حساب کاربری ندارید؟",
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
                            LoginRequest(
                              _usernameConroller.text,
                              _passwordConroller.text,
                            ),
                          );
                        },
                        isLoading: state is AuthLoadingState ? true : false,
                        text: "ورود به حساب کاربری",
                      )
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
