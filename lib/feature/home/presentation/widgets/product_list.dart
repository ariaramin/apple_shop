import 'package:apple_shop/config/component/product_item.dart';
import 'package:apple_shop/config/route/app_route_name.dart';
import 'package:apple_shop/feature/home/presentation/widgets/section_title.dart';
import 'package:apple_shop/feature/product/data/model/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductList extends StatelessWidget {
  final String title;
  final List<Product> productList;

  const ProductList({
    Key? key,
    required this.title,
    required this.productList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(
          title: title,
          visibleLeadingText: true,
          leadingTextOnTap: () {
            Navigator.of(context).pushNamed(
              AppRouteName.productList,
              arguments: title,
            );
          },
        ),
        const SizedBox(
          height: 20,
        ),
        Directionality(
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
                    child: Directionality(
                      textDirection: TextDirection.ltr,
                      child: ProductItem(
                        product: productList[index],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
