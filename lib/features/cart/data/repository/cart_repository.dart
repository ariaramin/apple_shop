import 'package:apple_shop/di/di.dart';
import 'package:apple_shop/features/cart/data/datasource/cart_datasource.dart';
import 'package:apple_shop/features/cart/domain/entities/cart_item_model.dart';

abstract class ICartItemRepository {
  List<CartItemModel> readCartItems();

  createCartItem(CartItemModel cartItem);

  // updateCartItem();

  deleteCartItem(CartItemModel cartItem);
}

class CartItemRepository extends ICartItemRepository {
  final ICartItemDatasource _datasource = locator.get();

  @override
  List<CartItemModel> readCartItems() {
    return _datasource.readCartItems();
  }

  @override
  createCartItem(CartItemModel cartItem) {
    _datasource.createCartItem(cartItem);
  }

  @override
  deleteCartItem(CartItemModel cartItem) {
    _datasource.deleteCartItem(cartItem);
  }
}
