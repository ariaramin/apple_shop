import 'package:apple_shop/locator/get_it.dart';
import 'package:apple_shop/utility/api_exception.dart';
import 'package:dio/dio.dart';

abstract class IAuthentication {
  Future<void> register(
    String username,
    String password,
    String confirmPassword,
  );

  Future<String> login(
    String username,
    String password,
  );
}

class AuthenticationService implements IAuthentication {
  final Dio _dio = locator.get();

  @override
  Future<String> login(String username, String password) async {
    try {
      var response = await _dio.post(
        "collections/users/auth-with-password",
        data: {
          'username': username,
          'password': password,
        },
      );
      if (response.statusCode == 200) {
        return response.data?["token"];
      }
    } on DioError catch (ex) {
      throw ApiException(
        ex.response?.statusCode,
        ex.response?.statusMessage,
      );
    } catch (ex) {
      throw ApiException(
        0,
        "Unknown error",
      );
    }
    return "";
  }

  @override
  Future<void> register(
    String username,
    String password,
    String confirmPassword,
  ) async {
    try {
      await _dio.post(
        "collections/users/records",
        data: {
          'username': username,
          'password': password,
          'passwordConfirm': confirmPassword,
        },
      );
    } on DioError catch (ex) {
      throw ApiException(
        ex.response?.statusCode,
        ex.response?.statusMessage,
      );
    } catch (ex) {
      throw ApiException(
        0,
        "Unknown error",
      );
    }
  }
}
