class Variant {
  final String? id;
  final String? name;
  final String? typeId;
  final String? value;
  final int? priceChange;

  const Variant({
    this.id,
    this.name,
    this.typeId,
    this.value,
    this.priceChange,
  });

  factory Variant.fromMapJson(Map<String, dynamic> jsonObject) {
    return Variant(
      id: jsonObject['id'],
      name: jsonObject['name'],
      typeId: jsonObject['type_id'],
      value: jsonObject['value'],
      priceChange: jsonObject['price_change'],
    );
  }
}
