import 'package:apple_shop/feature/authentication/data/datasource/auth_datasource.dart';
import 'package:apple_shop/feature/authentication/data/datasource/auth_datasource_impl.dart';
import 'package:apple_shop/feature/authentication/data/repository/auth_repository.dart';
import 'package:apple_shop/feature/authentication/data/repository/auth_repository_impl.dart';
import 'package:apple_shop/feature/authentication/domain/usecase/login.dart';
import 'package:apple_shop/feature/authentication/domain/usecase/register.dart';
import 'package:apple_shop/feature/category/data/datasource/category_datasource.dart';
import 'package:apple_shop/feature/category/data/repository/category_repository.dart';
import 'package:apple_shop/feature/category/domain/usecase/get_categories.dart';
import 'package:apple_shop/feature/home/data/datasource/banner_datasource.dart';
import 'package:apple_shop/feature/home/data/repository/banner_repository.dart';
import 'package:apple_shop/feature/home/domain/get_banners.dart';
import 'package:apple_shop/feature/product/data/datasource/product_datasource.dart';
import 'package:apple_shop/feature/product/data/repository/product_repository.dart';
import 'package:apple_shop/feature/product/domain/usecase/get_products.dart';
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

  //datasources
  locator.registerFactory<IAuthDatasource>(() => AuthDatasourceImpl());
  locator.registerFactory<ICategoryDatasource>(() => CategoryDatasource());
  locator.registerFactory<IBannerDatasource>(() => BannerDatasource());
  locator.registerFactory<IProductDatasource>(() => ProductDatasource());

  // repositories
  locator.registerFactory<IAuthRepository>(() => AuthRepositoryImpl());
  locator.registerFactory<ICategoryRepository>(() => CategoryRepository());
  locator.registerFactory<IBannerRepository>(() => BannerRepository());
  locator.registerFactory<IProductRepository>(() => ProductRepository());

  // usecases
  locator.registerFactory<Login>(() => Login());
  locator.registerFactory<Register>(() => Register());
  locator.registerFactory<GetCategories>(() => GetCategories());
  locator.registerFactory<GetBanners>(() => GetBanners());
  locator.registerFactory<GetProducts>(() => GetProducts());
}
