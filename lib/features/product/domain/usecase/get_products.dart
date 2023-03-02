import 'package:apple_shop/config/usecase/usecase.dart';
import 'package:apple_shop/config/utility/failure.dart';
import 'package:apple_shop/config/utility/filter.dart';
import 'package:apple_shop/di/di.dart';
import 'package:apple_shop/features/product/data/models/product.dart';
import 'package:apple_shop/features/product/data/repository/product_repository.dart';
import 'package:dartz/dartz.dart';

class ProductListParams extends Params {
  final Filter filter;

  ProductListParams({required this.filter});

  @override
  List<Object?> get props => [];
}

class GetProductList extends Usecase<Failure, List<Product>> {
  final IProductRepository _repository = locator.get();

  @override
  Future<Either<Failure, List<Product>>> call(Params? params) {
    var productParams = params != null ? params as ProductListParams : null;
    return _repository.getProductList(productParams?.filter);
  }
}
