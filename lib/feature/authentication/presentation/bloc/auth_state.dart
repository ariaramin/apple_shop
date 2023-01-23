import 'package:apple_shop/config/utility/failure.dart';
import 'package:dartz/dartz.dart';

abstract class AuthState {}

class AuthInitState extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthResponseState extends AuthState {
  Either<Failure, String> response;
  AuthResponseState(this.response);
}
