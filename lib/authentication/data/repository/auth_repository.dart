import 'package:dartz/dartz.dart';
import 'package:apple_shop/authentication/data/failure/auth_failure.dart';

abstract class IAuthRepository {
  Future<Either<AuthFailure, String>> register(
    String username,
    String password,
    String confirmPassword,
  );

  Future<Either<AuthFailure, String>> login(
    String username,
    String password,
  );
}
