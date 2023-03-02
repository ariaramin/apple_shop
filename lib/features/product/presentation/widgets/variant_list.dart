import 'package:apple_shop/features/product/data/models/product_variant.dart';
import 'package:apple_shop/features/product/data/models/variant_type.dart';
import 'package:apple_shop/features/product/presentation/widgets/color_item.dart';
import 'package:apple_shop/features/product/presentation/widgets/variant_item.dart';
import 'package:flutter/material.dart';

class VariantList extends StatefulWidget {
  final ProductVariant productVariant;

  const VariantList({
    super.key,
    required this.productVariant,
  });

  @override
  State<VariantList> createState() => _VariantListState();
}

class _VariantListState extends State<VariantList> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 14,
        right: 14,
        top: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            widget.productVariant.variantType!.title!,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          SizedBox(
            height: 32,
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.productVariant.variantList!.length,
                itemBuilder: (context, index) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: widget.productVariant.variantType!.type ==
                              VariantTypeEnum.color
                          ? GestureDetector(
                              onTap: () {
                                setState(() {
                                  _selectedIndex = index;
                                });
                              },
                              child: ColorItem(
                                index: index,
                                currentIndex: _selectedIndex,
                                color:
                                    widget.productVariant.variantList![index],
                              ),
                            )
                          : GestureDetector(
                              onTap: () {
                                setState(() {
                                  _selectedIndex = index;
                                });
                              },
                              child: VariantItem(
                                index: index,
                                currentIndex: _selectedIndex,
                                variant:
                                    widget.productVariant.variantList![index],
                              ),
                            ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
