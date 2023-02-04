import 'package:apple_shop/config/utility/filter.dart';
import 'package:equatable/equatable.dart';

abstract class ProductEvent extends Equatable {}

class ProductListRequest extends ProductEvent {
  final Filter filter;

  ProductListRequest({required this.filter});

  @override
  List<Object?> get props => [];
}
