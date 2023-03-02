import 'package:apple_shop/config/utility/api_exception.dart';
import 'package:apple_shop/config/utility/auth_exception.dart';
import 'package:apple_shop/features/authentication/data/datasource/auth_datasource.dart';
import 'package:apple_shop/di/di.dart';
import 'package:dio/dio.dart';

class AuthDatasourceImpl implements IAuthDatasource {
  final Dio _dio = locator.get();

  @override
  Future<String> login(String username, String password) async {
    try {
      var response = await _dio.post(
        "collections/users/auth-with-password",
        data: {
          'identity': username,
          'password': password,
        },
      );
      if (response.statusCode == 200) {
        return response.data?["token"];
      }
    } on DioError catch (ex) {
      throw AuthException(
        ex.response?.statusCode,
        ex.response?.data["data"],
      );
    } catch (ex) {
      throw const ApiException(0, "خطای نامشخص");
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
      throw AuthException(
        ex.response?.statusCode,
        ex.response?.data["data"],
      );
    } catch (ex) {
      throw const ApiException(0, "خطای نامشخص");
    }
  }
}
