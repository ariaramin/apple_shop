import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {}

class LoginRequest extends AuthEvent {
  final String username, password;
  LoginRequest(this.username, this.password);

  @override
  List<Object?> get props => [];
}

class RegisterRequest extends AuthEvent {
  final String username, password, confirmPassword;
  RegisterRequest(this.username, this.password, this.confirmPassword);

  @override
  List<Object?> get props => [];
}
