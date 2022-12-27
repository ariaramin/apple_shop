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
}
