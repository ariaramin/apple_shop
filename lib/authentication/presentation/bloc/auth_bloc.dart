import 'package:apple_shop/authentication/domain/usecase/auth_usecase.dart';
import 'package:apple_shop/authentication/presentation/bloc/auth_event.dart';
import 'package:apple_shop/authentication/presentation/bloc/auth_state.dart';
import 'package:apple_shop/di/di.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthUsecase _authUsecase = locator.get();

  AuthBloc() : super(AuthInitState()) {
    on<LoginRequest>(
      (event, emit) async {
        emit(AuthLoadingState());
        var response = await _authUsecase.login(event.username, event.password);
        emit(AuthResponseState(response));
      },
    );

    on<RegisterRequest>(
      (event, emit) async {
        emit(AuthLoadingState());
        var response = await _authUsecase.register(
          event.username,
          event.password,
          event.confirmPassword,
        );
        emit(AuthResponseState(response));
      },
    );
  }
}
