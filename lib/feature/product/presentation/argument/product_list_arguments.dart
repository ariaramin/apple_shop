import 'package:apple_shop/config/utility/filter.dart';
import 'package:apple_shop/feature/product/data/model/product.dart';

class ProductListArguments {
  final String title;
  final Filter filter;

  ProductListArguments({
    required this.title,
    required this.filter,
  });
}
