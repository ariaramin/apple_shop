import 'package:apple_shop/config/usecase/usecase.dart';
import 'package:apple_shop/config/utility/failure.dart';
import 'package:apple_shop/config/utility/filter.dart';
import 'package:apple_shop/di/di.dart';
import 'package:apple_shop/features/product/data/models/product.dart';
import 'package:apple_shop/features/product/data/repository/product_repository.dart';
import 'package:dartz/dartz.dart';

class GetBestSellerProducts extends Usecase<Failure, List<Product>> {
  final IProductRepository _repository = locator.get();

  @override
  Future<Either<Failure, List<Product>>> call(Params? params) {
    var filter = const Filter(filterSequence: "popularity='Best Seller'");
    return _repository.getProductList(filter);
  }
}
