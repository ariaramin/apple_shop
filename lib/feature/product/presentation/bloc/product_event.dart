import 'package:apple_shop/config/utility/filter.dart';
import 'package:equatable/equatable.dart';

abstract class ProductEvent extends Equatable {}

class ProductListRequest extends ProductEvent {
  final Filter filter;

  ProductListRequest({required this.filter});

  @override
  List<Object?> get props => [];
}

class ProductRequest extends ProductEvent {
  final String productId;

  ProductRequest({required this.productId});

  @override
  List<Object?> get props => [];
}
