import 'package:apple_shop/config/usecase/usecase.dart';
import 'package:apple_shop/config/utility/failure.dart';
import 'package:apple_shop/config/utility/filter.dart';
import 'package:apple_shop/di/di.dart';
import 'package:apple_shop/feature/product/data/model/product.dart';
import 'package:apple_shop/feature/product/data/repository/product_repository.dart';
import 'package:dartz/dartz.dart';

class ProductParams extends Params {
  final Filter filter;

  ProductParams({required this.filter});

  @override
  List<Object?> get props => [];
}

class GetProducts extends Usecase<Failure, List<Product>> {
  final IProductRepository _repository = locator.get();

  @override
  Future<Either<Failure, List<Product>>> call(Params? params) {
    var productParams = params != null ? params as ProductParams : null;
    return _repository.getProducts(productParams?.filter);
  }
}
