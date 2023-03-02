import 'dart:io';
import 'package:apple_shop/config/utility/api_exception.dart';
import 'package:apple_shop/config/utility/failure.dart';
import 'package:apple_shop/config/utility/filter.dart';
import 'package:apple_shop/di/di.dart';
import 'package:apple_shop/features/product/data/datasource/product_datasource.dart';
import 'package:apple_shop/features/product/data/models/product.dart';
import 'package:dartz/dartz.dart';

abstract class IProductRepository {
  Future<Either<Failure, List<Product>>> getProductList(Filter? filter);
  Future<Either<Failure, Product>> getProduct(String productId);
}

class ProductRepository extends IProductRepository {
  final IProductDatasource _datasource = locator.get();

  @override
  Future<Either<Failure, List<Product>>> getProductList(Filter? filter) async {
    try {
      var response = await _datasource.getProductList(filter);
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

  @override
  Future<Either<Failure, Product>> getProduct(String productId) async {
    try {
      var response = await _datasource.getProduct(productId);
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
