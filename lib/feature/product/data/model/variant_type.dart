class VariantType {
  final String? id;
  final String? name;
  final String? title;
  final VariantTypeEnum? type;

  const VariantType({
    this.id,
    this.name,
    this.title,
    this.type,
  });

  factory VariantType.fromMapjson(Map<String, dynamic> jsonObject) {
    return VariantType(
      id: jsonObject['id'],
      name: jsonObject['name'],
      title: jsonObject['title'],
      type: _getTypeEnum(jsonObject['type']),
    );
  }
}

VariantTypeEnum _getTypeEnum(String type) {
  switch (type) {
    case 'Color':
      return VariantTypeEnum.color;
    case 'Storage':
      return VariantTypeEnum.storage;
    case 'Voltage':
      return VariantTypeEnum.voltage;
    default:
      return VariantTypeEnum.color;
  }
}

enum VariantTypeEnum {
  color,
  storage,
  voltage,
}
