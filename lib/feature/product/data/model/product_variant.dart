import 'package:apple_shop/feature/product/data/model/variant.dart';
import 'package:apple_shop/feature/product/data/model/variant_type.dart';

class ProductVariant {
  final VariantType? variantType;
  final List<Variant>? variantList;

  const ProductVariant({
    this.variantType,
    this.variantList,
  });
}
