import 'package:apple_shop/config/utility/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {}

class AuthInitState extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthLoadingState extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthResponseState extends AuthState {
  final Either<Failure, String> response;
  AuthResponseState(this.response);

  @override
  List<Object?> get props => [];
}

// class AuthErrorState extends AuthState {
//   final String? message;
//   AuthErrorState(this.message);

//   @override
//   List<Object?> get props => [];
// }
