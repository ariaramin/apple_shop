import 'package:apple_shop/config/utility/failure.dart';
import 'package:apple_shop/feature/product/data/model/product.dart';
import 'package:apple_shop/feature/product/data/model/product_image_model.dart';
import 'package:apple_shop/feature/product/data/model/product_variant.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

abstract class ProductState extends Equatable {}

class ProductInitState extends ProductState {
  @override
  List<Object?> get props => [];
}

class ProductLoadingState extends ProductState {
  @override
  List<Object?> get props => [];
}

class ProductListResponseState extends ProductState {
  final Either<Failure, List<Product>> productList;

  ProductListResponseState({required this.productList});

  @override
  List<Object?> get props => [];
}

class ProductResponseState extends ProductState {
  final Either<Failure, Product> product;
  final Either<Failure, List<ProductImageModel>> productImageList;
  final Either<Failure, List<ProductVariant>> productVariantList;

  ProductResponseState({
    required this.product,
    required this.productImageList,
    required this.productVariantList,
  });

  @override
  List<Object?> get props => [];
}
