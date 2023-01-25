import 'package:equatable/equatable.dart';

class ApiException extends Equatable implements Exception {
  final int? code;
  final String? message;

  const ApiException(this.code, this.message);

  @override
  List<Object?> get props => [];
}
