import 'package:apple_shop/authentication/data/datasource/auth_datasource.dart';
import 'package:apple_shop/di/di.dart';
import 'package:apple_shop/utility/api_exception.dart';
import 'package:dio/dio.dart';

class AuthDatasourceImpl implements IAuthDatasource {
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
      throw ApiException(0, "خطای ناشناس");
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
      throw ApiException(0, "خطای ناشناس");
    }
  }
}
