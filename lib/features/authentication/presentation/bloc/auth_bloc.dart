import 'package:apple_shop/features/authentication/domain/usecase/login.dart';
import 'package:apple_shop/features/authentication/domain/usecase/register.dart';
import 'package:apple_shop/features/authentication/presentation/bloc/auth_event.dart';
import 'package:apple_shop/features/authentication/presentation/bloc/auth_state.dart';
import 'package:apple_shop/di/di.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final Login _login = locator.get();
  final Register _register = locator.get();

  AuthBloc() : super(AuthInitState()) {
    on<LoginRequest>(
      (event, emit) async {
        emit(AuthLoadingState());
        var params = LoginParams(
          username: event.username,
          password: event.password,
        );
        var response = await _login.call(params);
        emit(AuthResponseState(response));
      },
    );

    on<RegisterRequest>(
      (event, emit) async {
        emit(AuthLoadingState());
        var params = RegisterParams(
          username: event.username,
          password: event.password,
          confirmPassword: event.confirmPassword,
        );
        var response = await _register.call(params);
        emit(AuthResponseState(response));
      },
    );
  }
}
