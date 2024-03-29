import 'package:apple_shop/features/authentication/data/datasource/auth_datasource.dart';
import 'package:apple_shop/features/authentication/data/datasource/auth_datasource_impl.dart';
import 'package:apple_shop/features/authentication/data/repository/auth_repository.dart';
import 'package:apple_shop/features/authentication/data/repository/auth_repository_impl.dart';
import 'package:apple_shop/features/authentication/domain/usecase/login.dart';
import 'package:apple_shop/features/authentication/domain/usecase/register.dart';
import 'package:apple_shop/features/cart/data/datasource/cart_datasource.dart';
import 'package:apple_shop/features/cart/data/repository/cart_repository.dart';
import 'package:apple_shop/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:apple_shop/features/category/data/datasource/category_datasource.dart';
import 'package:apple_shop/features/category/data/repository/category_repository.dart';
import 'package:apple_shop/features/category/domain/usecase/get_categories.dart';
import 'package:apple_shop/features/home/data/datasource/banner_datasource.dart';
import 'package:apple_shop/features/home/data/repository/banner_repository.dart';
import 'package:apple_shop/features/home/domain/usecase/get_banners.dart';
import 'package:apple_shop/features/product/data/datasource/product_datasource.dart';
import 'package:apple_shop/features/product/data/datasource/product_detail_datasource.dart';
import 'package:apple_shop/features/product/data/repository/product_detail_repository.dart';
import 'package:apple_shop/features/product/data/repository/product_repository.dart';
import 'package:apple_shop/features/product/domain/usecase/get_best_seller_products.dart';
import 'package:apple_shop/features/product/domain/usecase/get_hotest_products.dart';
import 'package:apple_shop/features/product/domain/usecase/get_product.dart';
import 'package:apple_shop/features/product/domain/usecase/get_product_category.dart';
import 'package:apple_shop/features/product/domain/usecase/get_product_image.dart';
import 'package:apple_shop/features/product/domain/usecase/get_product_properties.dart';
import 'package:apple_shop/features/product/domain/usecase/get_product_variant.dart';
import 'package:apple_shop/features/product/domain/usecase/get_products.dart';
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
  locator.registerFactory<IProductDetailDatasource>(
      () => ProductDetailDatasource());
  locator.registerFactory<ICartItemDatasource>(() => CartItemDatasource());

  // repositories
  locator.registerFactory<IAuthRepository>(() => AuthRepositoryImpl());
  locator.registerFactory<ICategoryRepository>(() => CategoryRepository());
  locator.registerFactory<IBannerRepository>(() => BannerRepository());
  locator.registerFactory<IProductRepository>(() => ProductRepository());
  locator.registerFactory<IProductDetailRepository>(
      () => ProductDetailRepository());
  locator.registerFactory<ICartItemRepository>(() => CartItemRepository());

  // usecases
  locator.registerFactory<Login>(() => Login());
  locator.registerFactory<Register>(() => Register());
  locator.registerFactory<GetCategories>(() => GetCategories());
  locator.registerFactory<GetBanners>(() => GetBanners());
  locator.registerFactory<GetProduct>(() => GetProduct());
  locator.registerFactory<GetProductCategory>(() => GetProductCategory());
  locator.registerFactory<GetProductList>(() => GetProductList());
  locator.registerFactory<GetHotestProducts>(() => GetHotestProducts());
  locator.registerFactory<GetBestSellerProducts>(() => GetBestSellerProducts());
  locator.registerFactory<GetProductVariant>(() => GetProductVariant());
  locator.registerFactory<GetProductImage>(() => GetProductImage());
  locator.registerFactory<GetProductProperties>(() => GetProductProperties());
  // locator.registerFactory<GetCartItemList>(() => GetCartItemList());

  // bloc
  locator.registerSingleton<CartBloc>(CartBloc());
}
