import 'package:dartz/dartz.dart';
import 'package:apple_shop/authentication/data/failure/auth_failure.dart';

abstract class AuthState {}

class AuthInitState extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthResponseState extends AuthState {
  Either<AuthFailure, String> response;
  AuthResponseState(this.response);
}
