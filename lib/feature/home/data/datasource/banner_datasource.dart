import 'package:apple_shop/config/utility/api_exception.dart';
import 'package:apple_shop/di/di.dart';
import 'package:apple_shop/feature/home/data/model/banner.dart';
import 'package:dio/dio.dart';

abstract class IBannerDatasource {
  Future<List<BannerModel>> getBanners();
}

class BannerDatasource extends IBannerDatasource {
  final Dio _dio = locator.get();

  @override
  Future<List<BannerModel>> getBanners() async {
    try {
      var respones = await _dio.get("collections/banner/records");
      var items = respones.data["items"] as List;
      return items
          .map<BannerModel>((item) => BannerModel.fromMapJson(item))
          .toList();
    } on DioError catch (ex) {
      throw ApiException(
        ex.response?.statusCode,
        ex.response?.data["message"],
      );
    } catch (ex) {
      throw const ApiException(0, "خطای نامشخص");
    }
  }
}
