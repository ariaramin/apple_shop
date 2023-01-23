import 'dart:io';
import 'package:apple_shop/config/utility/api_exception.dart';
import 'package:apple_shop/config/utility/failure.dart';
import 'package:apple_shop/di/di.dart';
import 'package:apple_shop/feature/category/data/model/category.dart';
import 'package:dartz/dartz.dart';
import '../datasource/category_datasource.dart';

abstract class ICategoryRepository {
  Future<Either<Failure, List<Category>>> getCategories();
}

class CategoryRepository extends ICategoryRepository {
  final ICategoryDatasource _datasource = locator.get();

  @override
  Future<Either<Failure, List<Category>>> getCategories() async {
    try {
      var response = await _datasource.getCategories();
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
