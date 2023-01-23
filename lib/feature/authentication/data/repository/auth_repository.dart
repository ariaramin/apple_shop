import 'package:apple_shop/config/utility/failure.dart';
import 'package:dartz/dartz.dart';

abstract class IAuthRepository {
  Future<Either<Failure, String>> register(
    String username,
    String password,
    String confirmPassword,
  );

  Future<Either<Failure, String>> login(
    String username,
    String password,
  );
}
