import 'dart:io';
import 'package:apple_shop/config/utility/api_exception.dart';
import 'package:apple_shop/config/utility/failure.dart';
import 'package:apple_shop/di/di.dart';
import 'package:apple_shop/features/home/data/datasource/banner_datasource.dart';
import 'package:apple_shop/features/home/data/models/banner.dart';
import 'package:dartz/dartz.dart';

abstract class IBannerRepository {
  Future<Either<Failure, List<BannerModel>>> getBanners();
}

class BannerRepository extends IBannerRepository {
  final IBannerDatasource _datasource = locator.get();

  @override
  Future<Either<Failure, List<BannerModel>>> getBanners() async {
    try {
      var response = await _datasource.getBanners();
      return right(response);
    } on ApiException catch (ex) {
      return left(
        ServerFailure(ex.message ?? '.خطا محتوای متنی ندارد'),
      );
    } on SocketException {
      return left(
        const ConnectionFailure('اتصال به شبکه ناموفق بود'),
      );
    }
  }
}
