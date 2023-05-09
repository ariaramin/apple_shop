import 'package:apple_shop/features/cart/domain/entities/cart_item_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class ICartItemDatasource {
  List<CartItemModel> readCartItems();

  createCartItem(CartItemModel cartItem);

  // updateCartItem(CartItemModel cartItem, CartItemModel newCartItem);

  deleteCartItem(CartItemModel cartItem);
}

class CartItemDatasource extends ICartItemDatasource {
  final _cartItemBox = Hive.box<CartItemModel>("cart");

  @override
  List<CartItemModel> readCartItems() {
    return _cartItemBox.values.toList();
  }

  @override
  createCartItem(CartItemModel cartItem) {
    if (readCartItems()
        .where((element) => element.isSame(cartItem))
        .isNotEmpty) {
      var item =
          readCartItems().where((element) => element.isSame(cartItem)).first;
      item.quantity = item.quantity + 1;
      item.save();
    } else {
      _cartItemBox.add(cartItem);
    }
  }

  // @override
  // updateCartItem(CartItemModel cartItem, CartItemModel newCartItem) {
  //   cartItem.
  // }

  @override
  deleteCartItem(CartItemModel cartItem) {
    cartItem.delete();
  }
}
