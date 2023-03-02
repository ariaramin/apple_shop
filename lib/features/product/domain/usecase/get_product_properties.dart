import 'package:apple_shop/config/usecase/usecase.dart';
import 'package:apple_shop/config/utility/failure.dart';
import 'package:apple_shop/di/di.dart';
import 'package:apple_shop/features/product/data/models/property.dart';
import 'package:apple_shop/features/product/data/repository/product_detail_repository.dart';
import 'package:apple_shop/features/product/domain/usecase/get_product.dart';
import 'package:dartz/dartz.dart';

class GetProductProperties extends Usecase<Failure, List<Property>> {
  final IProductDetailRepository _repository = locator.get();

  @override
  Future<Either<Failure, List<Property>>> call(Params? params) {
    var productParams = params != null ? params as ProductParams : null;
    return _repository.getProductProperties(productParams!.productId);
  }
}
