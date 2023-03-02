import 'package:apple_shop/config/usecase/usecase.dart';
import 'package:apple_shop/config/utility/failure.dart';
import 'package:apple_shop/di/di.dart';
import 'package:apple_shop/features/product/data/models/product.dart';
import 'package:dartz/dartz.dart';
import 'package:apple_shop/features/product/data/repository/product_repository.dart';

class ProductParams extends Params {
  final String productId;
  final String? productCategoryId;

  ProductParams({
    required this.productId,
    this.productCategoryId,
  });

  @override
  List<Object?> get props => [];
}

class GetProduct extends Usecase<Failure, Product> {
  final IProductRepository _repository = locator.get();

  @override
  Future<Either<Failure, Product>> call(Params? params) {
    var productParams = params != null ? params as ProductParams : null;
    return _repository.getProduct(productParams!.productId);
  }
}
