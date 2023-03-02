class ProductImageModel {
  final String? id;
  final String? imageUrl;
  final String? productId;

  const ProductImageModel({
    this.id,
    this.imageUrl,
    this.productId,
  });

  factory ProductImageModel.fromMapJson(Map<String, dynamic> jsonObject) {
    return ProductImageModel(
      id: jsonObject['id'],
      imageUrl:
          'http://startflutter.ir/api/files/${jsonObject['collectionId']}/${jsonObject['id']}/${jsonObject['image']}',
      productId: jsonObject['product_id'],
    );
  }
}
