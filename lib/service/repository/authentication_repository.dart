import 'package:apple_shop/locator/get_it.dart';
import 'package:apple_shop/service/api/authentication_service.dart';
import 'package:apple_shop/utility/api_exception.dart';
import 'package:apple_shop/utility/auth_manager.dart';
import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class IAuthRepository {
  Future<Either<String, String>> register(
    String username,
    String password,
    String confirmPassword,
  );

  Future<Either<String, String>> login(
    String username,
    String password,
  );
}

class AuthenticationRepository implements IAuthRepository {
  final AuthenticationService _service = locator.get();
  final SharedPreferences _sharedPref = locator.get();

  @override
  Future<Either<String, String>> login(
    String username,
    String password,
  ) async {
    try {
      var token = await _service.login(username, password);
      if (token.isNotEmpty) {
        AuthManager.saveToken(token);
        return right('شما وارد شده اید');
      } else {
        return left('خطایی در ورود پیش آمده!');
      }
    } on ApiException catch (ex) {
      return left(ex.message ?? '.خطا محتوای متنی ندارد');
    }
  }

  @override
  Future<Either<String, String>> register(
    String username,
    String password,
    String confirmPassword,
  ) async {
    try {
      await _service.register(username, password, confirmPassword);
      return right('ثبت نام با موفقیت انجام شد!');
    } on ApiException catch (ex) {
      return left(ex.message ?? '.خطا محتوای متنی ندارد');
    }
  }
}
