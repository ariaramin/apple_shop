// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_item_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CartItemModelAdapter extends TypeAdapter<CartItemModel> {
  @override
  final int typeId = 5;

  @override
  CartItemModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CartItemModel(
      id: fields[0] as String?,
      thumbnail: fields[1] as String?,
      description: fields[3] as String?,
      discountPrice: fields[5] as int?,
      price: fields[6] as int?,
      name: fields[2] as String?,
      category: fields[4] as String?,
      percent: fields[8] as int?,
      realPrice: fields[7] as int?,
      color: fields[9] as Variant?,
      variantList: (fields[10] as List?)?.cast<Variant>(),
      quantity: fields[11] as int,
    );
  }

  @override
  void write(BinaryWriter writer, CartItemModel obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.thumbnail)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.category)
      ..writeByte(5)
      ..write(obj.discountPrice)
      ..writeByte(6)
      ..write(obj.price)
      ..writeByte(7)
      ..write(obj.realPrice)
      ..writeByte(8)
      ..write(obj.percent)
      ..writeByte(9)
      ..write(obj.color)
      ..writeByte(10)
      ..write(obj.variantList)
      ..writeByte(11)
      ..write(obj.quantity);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CartItemModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
