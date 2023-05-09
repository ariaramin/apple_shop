import 'package:apple_shop/config/usecase/usecase.dart';
import 'package:apple_shop/config/utility/failure.dart';
import 'package:apple_shop/di/di.dart';
import 'package:apple_shop/features/home/data/models/banner.dart';
import 'package:apple_shop/features/home/data/repository/banner_repository.dart';
import 'package:dartz/dartz.dart';

class GetBanners extends Usecase<Failure, List<BannerModel>> {
  final IBannerRepository _repository = locator.get();

  @override
  Future<Either<Failure, List<BannerModel>>> call(Params? params) {
    return _repository.getBanners();
  }
}
