import 'package:apple_shop/config/utility/api_exception.dart';
import 'package:apple_shop/di/di.dart';
import 'package:apple_shop/features/category/data/models/category.dart';
import 'package:dio/dio.dart';

abstract class ICategoryDatasource {
  Future<List<Category>> getCategories();
}

class CategoryDatasource extends ICategoryDatasource {
  final Dio _dio = locator.get();

  @override
  Future<List<Category>> getCategories() async {
    try {
      var respones = await _dio.get("collections/category/records");
      var items = respones.data["items"] as List;
      return items.map<Category>((item) => Category.fromMapJson(item)).toList();
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
