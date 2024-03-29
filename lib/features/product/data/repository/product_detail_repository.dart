import 'dart:io';
import 'package:apple_shop/config/utility/api_exception.dart';
import 'package:apple_shop/config/utility/failure.dart';
import 'package:apple_shop/di/di.dart';
import 'package:apple_shop/features/category/data/models/category.dart';
import 'package:apple_shop/features/product/data/datasource/product_detail_datasource.dart';
import 'package:apple_shop/features/product/data/models/product_image_model.dart';
import 'package:apple_shop/features/product/data/models/product_variant.dart';
import 'package:apple_shop/features/product/data/models/property.dart';
import 'package:apple_shop/features/product/data/models/variant_type.dart';
import 'package:dartz/dartz.dart';

abstract class IProductDetailRepository {
  Future<Either<Failure, List<ProductImageModel>>> getProuctImage(
      String productId);
  Future<Either<Failure, List<VariantType>>> getVariantTypes();
  Future<Either<Failure, List<ProductVariant>>> getProductVarinats(
      String productId);
  Future<Either<Failure, Category>> getProductCategory(String categoryId);
  Future<Either<Failure, List<Property>>> getProductProperties(
      String productId);
}

class ProductDetailRepository extends IProductDetailRepository {
  final IProductDetailDatasource _datasource = locator.get();

  @override
  Future<Either<Failure, List<ProductImageModel>>> getProuctImage(
      String productId) async {
    try {
      var response = await _datasource.getGallery(productId);
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
  Future<Either<Failure, List<VariantType>>> getVariantTypes() async {
    try {
      var response = await _datasource.getVariantTypes();
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
  Future<Either<Failure, List<ProductVariant>>> getProductVarinats(
      String productId) async {
    try {
      var response = await _datasource.getProductVariants(productId);
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
  Future<Either<Failure, Category>> getProductCategory(
      String categoryId) async {
    try {
      var response = await _datasource.getProductCategory(categoryId);
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
  Future<Either<Failure, List<Property>>> getProductProperties(
      String productId) async {
    try {
      var response = await _datasource.getProductProperties(productId);
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
