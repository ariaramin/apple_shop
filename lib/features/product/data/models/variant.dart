import 'package:hive_flutter/hive_flutter.dart';

part 'variant.g.dart';

@HiveType(typeId: 10)
class Variant {
  @HiveField(0)
  final String? id;
  @HiveField(1)
  final String? name;
  @HiveField(2)
  final String? typeId;
  @HiveField(3)
  final String? value;
  @HiveField(4)
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
