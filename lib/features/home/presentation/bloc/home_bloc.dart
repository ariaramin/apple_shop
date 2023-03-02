import 'package:apple_shop/di/di.dart';
import 'package:apple_shop/features/category/domain/usecase/get_categories.dart';
import 'package:apple_shop/features/home/domain/get_banners.dart';
import 'package:apple_shop/features/home/presentation/bloc/home_event.dart';
import 'package:apple_shop/features/home/presentation/bloc/home_state.dart';
import 'package:apple_shop/features/product/domain/usecase/get_best_seller_products.dart';
import 'package:apple_shop/features/product/domain/usecase/get_hotest_products.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetBanners _getBanners = locator.get();
  final GetCategories _getCategories = locator.get();
  final GetHotestProducts _getHotestProducts = locator.get();
  final GetBestSellerProducts _getBestSellerProducts = locator.get();

  HomeBloc() : super(HomeInitState()) {
    // // fetch banners
    // on<BannerRequest>(
    //   (event, emit) async {
    //     emit(HomeLoadingState());
    //     var response = await _getBanners.call(null);
    //     emit(HomeResponseState(response));
    //   },
    // );

    // // fetch categories
    // on<CategoryRequest>(
    //   (event, emit) async {
    //     emit(HomeLoadingState());
    //     var response = await _getCategories.call(null);
    //     emit(CategoryResponseState(response));
    //   },
    // );

    on<HomeInitRequest>(
      (event, emit) async {
        emit(HomeLoadingState());
        var bannerList = await _getBanners.call(null);
        var categoryList = await _getCategories.call(null);
        var hotestProductList = await _getHotestProducts.call(null);
        var bestSellerProductList = await _getBestSellerProducts.call(null);

        emit(HomeResponseState(
          bannerList: bannerList,
          categoryList: categoryList,
          hotestProductList: hotestProductList,
          bestSellerProductList: bestSellerProductList,
        ));
      },
    );
  }
}
