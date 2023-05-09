import 'package:apple_shop/features/cart/domain/entities/cart_item_model.dart';
import 'package:equatable/equatable.dart';

abstract class CartState extends Equatable {}

class CartInitState extends CartState {
  CartInitState();

  @override
  List<Object> get props => [];
}

class CartLoadingState extends CartState {
  CartLoadingState();

  @override
  List<Object> get props => [];
}

class CartItemListResponse extends CartState {
  final List<CartItemModel> cartItemList;

  CartItemListResponse({required this.cartItemList});

  @override
  List<Object> get props => [];
}
