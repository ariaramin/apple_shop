import 'dart:io';
import 'package:apple_shop/config/utility/api_exception.dart';
import 'package:apple_shop/config/utility/failure.dart';
import 'package:apple_shop/config/utility/filter.dart';
import 'package:apple_shop/di/di.dart';
import 'package:apple_shop/feature/product/data/datasource/product_datasource.dart';
import 'package:apple_shop/feature/product/data/model/product.dart';
import 'package:dartz/dartz.dart';

abstract class IProductRepository {
  Future<Either<Failure, List<Product>>> getProducts(Filter? filter);
}

class ProductRepository extends IProductRepository {
  final IProductDatasource _datasource = locator.get();

  @override
  Future<Either<Failure, List<Product>>> getProducts(Filter? filter) async {
    try {
      var response = await _datasource.getProducts(filter);
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
