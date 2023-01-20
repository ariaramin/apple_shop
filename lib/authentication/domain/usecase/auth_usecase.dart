import 'package:apple_shop/authentication/data/failure/auth_failure.dart';
import 'package:apple_shop/authentication/data/repository/auth_repository.dart';
import 'package:apple_shop/di/di.dart';
import 'package:dartz/dartz.dart';

class AuthUsecase {
  final IAuthRepository _repository = locator.get();

  Future<Either<AuthFailure, String>> register(
    String username,
    String password,
    String confirmPassword,
  ) {
    return _repository.register(username, password, confirmPassword);
  }

  Future<Either<AuthFailure, String>> login(
    String username,
    String password,
  ) {
    return _repository.login(username, password);
  }
}
