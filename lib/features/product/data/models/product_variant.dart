import 'package:apple_shop/features/product/data/models/variant.dart';
import 'package:apple_shop/features/product/data/models/variant_type.dart';

class ProductVariant {
  final VariantType? variantType;
  final List<Variant>? variantList;

  const ProductVariant({
    this.variantType,
    this.variantList,
  });
}
