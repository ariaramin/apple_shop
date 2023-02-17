import 'package:apple_shop/config/usecase/usecase.dart';
import 'package:apple_shop/config/utility/failure.dart';
import 'package:apple_shop/di/di.dart';
import 'package:apple_shop/feature/product/data/model/product_variant.dart';
import 'package:apple_shop/feature/product/data/repository/product_detail_repository.dart';
import 'package:apple_shop/feature/product/domain/usecase/get_product.dart';
import 'package:dartz/dartz.dart';

class GetProductVariant extends Usecase<Failure, List<ProductVariant>> {
  final IProductDetailRepository _repository = locator.get();

  @override
  Future<Either<Failure, List<ProductVariant>>> call(Params? params) {
    var productParams = params != null ? params as ProductParams : null;
    return _repository.getProductVarinats(productParams!.productId);
  }
}
