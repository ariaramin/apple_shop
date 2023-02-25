import 'package:apple_shop/config/component/cashed_image.dart';
import 'package:apple_shop/config/route/app_route_name.dart';
import 'package:apple_shop/config/utility/filter.dart';
import 'package:apple_shop/feature/category/data/model/category.dart';
import 'package:apple_shop/config/component/chip_item.dart';
import 'package:apple_shop/feature/home/presentation/widgets/section_title.dart';
import 'package:apple_shop/feature/product/presentation/argument/product_list_arguments.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';

class CategoryList extends StatelessWidget {
  final List<Category> categoryList;

  const CategoryList({
    Key? key,
    required this.categoryList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SectionTitle(
          title: "دسته بندی ها",
          visibleLeadingText: false,
        ),
        Directionality(
          textDirection: TextDirection.rtl,
          child: SizedBox(
            height: 98,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categoryList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        AppRouteName.productList,
                        arguments: ProductListArguments(
                          title: categoryList[index].title!,
                          filter: Filter(
                            filterSequence:
                                "category='${categoryList[index].id}'",
                          ),
                        ),
                      );
                    },
                    child: ChipItem(
                      title: categoryList[index].title!,
                      icon: SizedBox(
                        width: 24,
                        height: 24,
                        child: Center(
                          child:
                              CachedImage(imageUrl: categoryList[index].icon),
                        ),
                      ),
                      color: HexColor(categoryList[index].color!),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
