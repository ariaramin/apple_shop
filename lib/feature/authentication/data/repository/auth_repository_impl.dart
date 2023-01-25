import 'dart:io';
import 'package:apple_shop/config/utility/api_exception.dart';
import 'package:apple_shop/config/utility/auth_exception.dart';
import 'package:apple_shop/config/utility/failure.dart';
import 'package:apple_shop/feature/authentication/data/datasource/auth_datasource.dart';
import 'package:apple_shop/feature/authentication/data/repository/auth_repository.dart';
import 'package:apple_shop/di/di.dart';
import 'package:dartz/dartz.dart';
import 'package:apple_shop/feature/authentication/data/utility/auth_manager.dart';

class AuthRepositoryImpl implements IAuthRepository {
  final IAuthDatasource _datasource = locator.get();

  @override
  Future<Either<Failure, String>> login(
    String username,
    String password,
  ) async {
    try {
      var token = await _datasource.login(username, password);
      if (token.isNotEmpty) {
        AuthManager.saveToken(token);
        return right('شما وارد شده اید');
      } else {
        return left(
          const ServerFailure('خطایی در ورود پیش آمده!'),
        );
      }
    } on AuthException catch (ex) {
      return left(
        AuthFailure("احراز هویت ناموفق بود.", ex.error),
      );
    } on ApiException catch (ex) {
      return left(
        ServerFailure(ex.message ?? '.خطا محتوای متنی ندارد'),
      );
    } on SocketException {
      return left(
        const ConnectionFailure('اتصال به شبکه ناموفق بود'),
      );
    }
  }

  @override
  Future<Either<Failure, String>> register(
    String username,
    String password,
    String confirmPassword,
  ) async {
    try {
      await _datasource.register(username, password, confirmPassword);
      return right('ثبت نام با موفقیت انجام شد!');
    } on AuthException catch (ex) {
      return left(
        AuthFailure("ثبت نام ناموفق بود.", ex.error),
      );
    } on ApiException catch (ex) {
      return left(
        ServerFailure(ex.message ?? '.خطا محتوای متنی ندارد'),
      );
    } on SocketException {
      return left(
        const ConnectionFailure('اتصال به شبکه ناموفق بود'),
      );
    }
  }
}
