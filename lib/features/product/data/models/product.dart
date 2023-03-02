class Product {
  final String? id;
  final String? collectionId;
  final String? thumbnail;
  final String? name;
  final String? description;
  final String? category;
  final int? discountPrice;
  final int? price;
  final String? popularity;
  final int? quantity;
  int? realPrice;
  num? persent;

  Product({
    this.id,
    this.collectionId,
    this.thumbnail,
    this.description,
    this.discountPrice,
    this.price,
    this.popularity,
    this.name,
    this.quantity,
    this.category,
  }) {
    realPrice = (price! + discountPrice!);
    persent = ((price! - realPrice!) / price!) * 100;
  }

  factory Product.fromMapJson(Map<String, dynamic> jsonObject) {
    return Product(
      id: jsonObject['id'],
      collectionId: jsonObject['collectionId'],
      thumbnail:
          'http://startflutter.ir/api/files/${jsonObject['collectionId']}/${jsonObject['id']}/${jsonObject['thumbnail']}',
      name: jsonObject['name'],
      description: jsonObject['description'],
      category: jsonObject['category'],
      discountPrice: jsonObject['discount_price'],
      price: jsonObject['price'],
      popularity: jsonObject['popularity'],
      quantity: jsonObject['quantity'],
    );
  }
}
