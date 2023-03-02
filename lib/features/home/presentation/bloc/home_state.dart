import 'package:apple_shop/config/utility/failure.dart';
import 'package:apple_shop/features/category/data/models/category.dart';
import 'package:apple_shop/features/home/data/models/banner.dart';
import 'package:apple_shop/features/product/data/models/product.dart';
import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';

abstract class HomeState extends Equatable {}

class HomeInitState extends HomeState {
  @override
  List<Object?> get props => [];
}

class HomeLoadingState extends HomeState {
  @override
  List<Object?> get props => [];
}

// class BannerResponseState extends HomeState {
//   final Either<Failure, List<BannerModel>> response;
//   BannerResponseState(this.response);

//   @override
//   List<Object?> get props => [];
// }

// class CategoryResponseState extends HomeState {
//   final Either<Failure, List<Category>> response;
//   CategoryResponseState(this.response);

//   @override
//   List<Object?> get props => [];
// }

class HomeResponseState extends HomeState {
  final Either<Failure, List<BannerModel>> bannerList;
  final Either<Failure, List<Category>> categoryList;
  final Either<Failure, List<Product>> hotestProductList;
  final Either<Failure, List<Product>> bestSellerProductList;

  HomeResponseState({
    required this.bannerList,
    required this.categoryList,
    required this.hotestProductList,
    required this.bestSellerProductList,
  });

  @override
  List<Object?> get props => [];
}
