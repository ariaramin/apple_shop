import 'package:apple_shop/config/component/product_item.dart';
import 'package:apple_shop/features/product/data/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductList extends StatelessWidget {
  final List<Product> productList;

  const ProductList({
    Key? key,
    required this.productList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SizedBox(
        height: 264,
        child: Center(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: productList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                  bottom: 38,
                ),
                child: ProductItem(
                  product: productList[index],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
