import 'package:apple_shop/config/utility/failure.dart';
import 'package:apple_shop/feature/category/data/model/category.dart';
import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';

abstract class CategoryState extends Equatable {}

class CategoryInitState extends CategoryState {
  @override
  List<Object?> get props => [];
}

class CategoryLoadingState extends CategoryState {
  @override
  List<Object?> get props => [];
}

class CategoryResponseState extends CategoryState {
  final Either<Failure, List<Category>> response;
  CategoryResponseState(this.response);

  @override
  List<Object?> get props => [];
}
