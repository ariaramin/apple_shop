import 'package:apple_shop/config/utility/api_exception.dart';
import 'package:apple_shop/config/utility/filter.dart';
import 'package:apple_shop/di/di.dart';
import 'package:apple_shop/feature/product/data/model/product.dart';
import 'package:dio/dio.dart';

abstract class IProductDatasource {
  Future<List<Product>> getProducts(Filter? filter);
}

class ProductDatasource extends IProductDatasource {
  final Dio _dio = locator.get();

  @override
  Future<List<Product>> getProducts(Filter? filter) async {
    try {
      var respones = await _dio.get(
        "collections/products/records",
        queryParameters: {
          "filter": filter?.filterSequence,
        },
      );
      var items = respones.data["items"] as List;
      return items.map<Product>((item) => Product.fromMapJson(item)).toList();
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
