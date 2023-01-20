import 'dart:io';
import 'package:apple_shop/authentication/data/failure/auth_failure.dart';
import 'package:apple_shop/authentication/data/repository/auth_repository.dart';
import 'package:apple_shop/di/di.dart';
import 'package:dartz/dartz.dart';
import 'package:apple_shop/authentication/data/datasource/authentication_service.dart';
import 'package:apple_shop/utility/api_exception.dart';
import 'package:apple_shop/authentication/data/utility/auth_manager.dart';

class AuthRepositoryImpl implements IAuthRepository {
  final AuthDatasourceImpl _service = locator.get();

  @override
  Future<Either<AuthFailure, String>> login(
    String username,
    String password,
  ) async {
    try {
      var token = await _service.login(username, password);
      if (token.isNotEmpty) {
        AuthManager.saveToken(token);
        return right('شما وارد شده اید');
      } else {
        return left(const ServerFailure('خطایی در ورود پیش آمده!'));
      }
    } on ApiException catch (ex) {
      return left(ServerFailure(ex.message ?? '.خطا محتوای متنی ندارد'));
    } on SocketException {
      return left(const ConnectionFailure('اتصال به شبکه ناموفق بود'));
    }
  }

  @override
  Future<Either<AuthFailure, String>> register(
    String username,
    String password,
    String confirmPassword,
  ) async {
    try {
      await _service.register(username, password, confirmPassword);
      return right('ثبت نام با موفقیت انجام شد!');
    } on ApiException catch (ex) {
      return left(ServerFailure(ex.message ?? ""));
    } on SocketException {
      return left(const ConnectionFailure('اتصال به شبکه ناموفق بود'));
    }
  }
}
