import 'package:apple_shop/config/utility/failure.dart';
import 'package:apple_shop/feature/home/data/model/banner.dart';
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

class BannerResponseState extends HomeState {
  final Either<Failure, List<BannerModel>> response;
  BannerResponseState(this.response);

  @override
  List<Object?> get props => [];
}
