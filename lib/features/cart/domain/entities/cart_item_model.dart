import 'package:apple_shop/features/product/data/models/variant.dart';
import 'package:hive/hive.dart';

part 'cart_item_model.g.dart';

@HiveType(typeId: 5)
class CartItemModel extends HiveObject {
  @HiveField(0)
  final String? id;
  @HiveField(1)
  final String? thumbnail;
  @HiveField(2)
  final String? name;
  @HiveField(3)
  final String? description;
  @HiveField(4)
  final String? category;
  @HiveField(5)
  final int? discountPrice;
  @HiveField(6)
  final int? price;
  @HiveField(7)
  final int? realPrice;
  @HiveField(8)
  final int? percent;
  @HiveField(9)
  final Variant? color;
  @HiveField(10)
  final List<Variant>? variantList;
  @HiveField(11)
  int quantity;

  CartItemModel({
    this.id,
    this.thumbnail,
    this.description,
    this.discountPrice,
    this.price,
    this.name,
    this.category,
    this.percent,
    this.realPrice,
    this.color,
    this.variantList,
    this.quantity = 1,
  });

  isSame(CartItemModel cartItemModel) {
    return (cartItemModel.id == id && cartItemModel.color!.id == color!.id);
  }

  // static CartItemModel copyWith({
  //   required Product product,
  //   required Variant? color,
  //   required List<Variant>? variantList,
  // }) {
  //   return CartItemModel(
  //     id: product.id,
  //     thumbnail: product.thumbnail,
  //     name: product.name,
  //     description: product.description,
  //     category: product.category,
  //     discountPrice: product.discountPrice,
  //     price: product.price,
  //     realPrice: product.realPrice,
  //     percent: product.percent,
  //     color: color,
  //     variantList: variantList,
  //   );
  // }
}
