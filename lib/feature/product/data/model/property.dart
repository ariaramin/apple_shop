class Property {
  final String? id;
  final String? productId;
  final String? title;
  final String? value;

  const Property({
    this.id,
    this.productId,
    this.title,
    this.value,
  });

  factory Property.fromMapJson(Map<String, dynamic> jsonObject) {
    return Property(
      id: jsonObject['id'],
      productId: jsonObject['product_id'],
      title: jsonObject['title'],
      value: jsonObject['value'],
    );
  }
}
