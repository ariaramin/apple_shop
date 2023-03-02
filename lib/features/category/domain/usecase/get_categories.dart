import 'package:apple_shop/config/usecase/usecase.dart';
import 'package:apple_shop/config/utility/failure.dart';
import 'package:apple_shop/di/di.dart';
import 'package:apple_shop/features/category/data/models/category.dart';
import 'package:apple_shop/features/category/data/repository/category_repository.dart';
import 'package:dartz/dartz.dart';

class GetCategories extends Usecase<Failure, List<Category>> {
  final ICategoryRepository _repository = locator.get();

  @override
  Future<Either<Failure, List<Category>>> call(Params? params) {
    return _repository.getCategories();
  }
}
