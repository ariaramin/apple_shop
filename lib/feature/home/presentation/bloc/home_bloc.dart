import 'package:apple_shop/di/di.dart';
import 'package:apple_shop/feature/category/domain/usecase/get_categories.dart';
import 'package:apple_shop/feature/home/domain/get_banners.dart';
import 'package:apple_shop/feature/home/presentation/bloc/home_event.dart';
import 'package:apple_shop/feature/home/presentation/bloc/home_state.dart';
import 'package:apple_shop/feature/product/domain/usecase/get_products.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetBanners _getBanners = locator.get();
  final GetCategories _getCategories = locator.get();
  final GetProducts _getProducts = locator.get();

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
        var productList = await _getProducts.call(null);

        emit(HomeResponseState(
          bannerList: bannerList,
          categoryList: categoryList,
          productList: productList,
        ));
      },
    );
  }
}
