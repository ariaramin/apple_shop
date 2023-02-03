import 'package:apple_shop/config/usecase/usecase.dart';
import 'package:apple_shop/config/utility/failure.dart';
import 'package:apple_shop/di/di.dart';
import 'package:apple_shop/feature/product/data/model/product.dart';
import 'package:apple_shop/feature/product/data/repository/product_repository.dart';
import 'package:dartz/dartz.dart';

class GetProducts extends Usecase<Failure, List<Product>> {
  final IProductRepository _repository = locator.get();

  @override
  Future<Either<Failure, List<Product>>> call(Params? params) {
    return _repository.getProducts();
  }
}
