import 'package:equatable/equatable.dart';

class AuthException extends Equatable implements Exception {
  final int? code;
  final Map<String, dynamic>? error;

  const AuthException(this.code, this.error);

  @override
  List<Object?> get props => [];
}
