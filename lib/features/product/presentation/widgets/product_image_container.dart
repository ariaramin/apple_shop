import 'package:apple_shop/config/component/cached_image.dart';
import 'package:apple_shop/features/product/data/models/product_image_model.dart';
import 'package:apple_shop/features/product/presentation/widgets/product_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductImageContainer extends StatefulWidget {
  final String productImage;
  final List<ProductImageModel> productImageList;

  const ProductImageContainer({
    super.key,
    required this.productImage,
    required this.productImageList,
  });

  @override
  State<ProductImageContainer> createState() => _ProductImageContainerState();
}

class _ProductImageContainerState extends State<ProductImageContainer> {
  int _selectedImage = 0;

  @override
  void initState() {
    widget.productImageList.insert(
      0,
      ProductImageModel(
        imageUrl: widget.productImage,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2.4,
      margin: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Expanded(
            child: Stack(
              alignment: AlignmentDirectional.center,
              fit: StackFit.expand,
              children: [
                Positioned(
                  top: 10,
                  left: 10,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "۴.۵",
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      SvgPicture.asset("assets/icons/star.svg"),
                    ],
                  ),
                ),
                Positioned(
                  top: 24,
                  bottom: 14,
                  child: CachedImage(
                    imageUrl: widget.productImageList[_selectedImage].imageUrl,
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: SvgPicture.asset(
                    "assets/icons/like.svg",
                    width: 26,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 82,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.productImageList.length,
              itemBuilder: (context, index) {
                return Center(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedImage = index;
                      });
                    },
                    child: ProductImage(
                      image: widget.productImageList[index].imageUrl!,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
