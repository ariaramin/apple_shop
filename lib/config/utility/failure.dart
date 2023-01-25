import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String? message;
  const Failure(this.message);
}

class ServerFailure extends Failure {
  const ServerFailure(String message) : super(message);

  @override
  List<Object?> get props => [];
}

class AuthFailure extends Failure {
  final Map<String, dynamic>? error;
  const AuthFailure(String message, this.error) : super(message);

  @override
  List<Object?> get props => [];
}

class ConnectionFailure extends Failure {
  const ConnectionFailure(String message) : super(message);

  @override
  List<Object?> get props => [];
}
