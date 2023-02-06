import 'package:apple_shop/config/utility/failure.dart';
import 'package:apple_shop/feature/product/data/model/product.dart';
import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';

abstract class SearchState extends Equatable {}

class SearchInitState extends SearchState {
  @override
  List<Object?> get props => [];
}

class SearchLoadingState extends SearchState {
  @override
  List<Object?> get props => [];
}

class SearchResponseState extends SearchState {
  final Either<Failure, List<Product>> productList;

  SearchResponseState({
    required this.productList,
  });

  @override
  List<Object?> get props => [];
}
