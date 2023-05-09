import 'package:apple_shop/di/di.dart';
import 'package:apple_shop/features/cart/data/repository/cart_repository.dart';
import 'package:apple_shop/features/cart/presentation/bloc/cart_event.dart';
import 'package:apple_shop/features/cart/presentation/bloc/cart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final ICartItemRepository _repository = locator.get();

  CartBloc() : super(CartInitState()) {
    on<FetchCartItemsEvent>(
      (event, emit) {
        emit(CartLoadingState());
        var cartItems = _repository.readCartItems();
        emit(CartItemListResponse(cartItemList: cartItems));
      },
    );

    on<AddCartItemEvent>(
      (event, emit) {
        emit(CartLoadingState());
        _repository.createCartItem(event.cartItem);
        add(const FetchCartItemsEvent());
      },
    );

    on<DeleteCartItemEvent>(
      (event, emit) {
        emit(CartLoadingState());
        _repository.deleteCartItem(event.cartItem);
        add(const FetchCartItemsEvent());
      },
    );
  }
}
