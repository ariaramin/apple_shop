import 'package:apple_shop/features/cart/domain/entities/cart_item_model.dart';
import 'package:equatable/equatable.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class FetchCartItemsEvent extends CartEvent {
  const FetchCartItemsEvent();

  @override
  List<Object> get props => [];
}

class AddCartItemEvent extends CartEvent {
  final CartItemModel cartItem;

  const AddCartItemEvent({required this.cartItem});

  @override
  List<Object> get props => [];
}

class DeleteCartItemEvent extends CartEvent {
  final CartItemModel cartItem;

  const DeleteCartItemEvent({required this.cartItem});

  @override
  List<Object> get props => [];
}
