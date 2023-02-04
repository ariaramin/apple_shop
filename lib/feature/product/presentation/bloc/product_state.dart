import 'package:apple_shop/config/utility/failure.dart';
import 'package:apple_shop/feature/product/data/model/product.dart';
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

class ProductResponseState extends ProductState {
  final Either<Failure, List<Product>> productList;

  ProductResponseState({required this.productList});

  @override
  List<Object?> get props => [];
}
