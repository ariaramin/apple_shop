import 'package:apple_shop/authentication/data/repository/auth_repository.dart';
import 'package:apple_shop/authentication/data/repository/auth_repository_impl.dart';
import 'package:apple_shop/authentication/domain/usecase/auth_usecase.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

var locator = GetIt.instance;

Future<void> getItInit() async {
  // dio
  locator.registerSingleton<Dio>(
    Dio(BaseOptions(baseUrl: 'http://startflutter.ir/api/')),
  );

  // shared preferences
  locator.registerFactory(() => SharedPreferences.getInstance());

  // auth repository
  locator.registerFactory<IAuthRepository>(() => AuthRepositoryImpl());

  // auth usecase
  locator.registerFactory<AuthUsecase>(() => AuthUsecase());
}
