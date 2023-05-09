// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'variant.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class VariantAdapter extends TypeAdapter<Variant> {
  @override
  final int typeId = 10;

  @override
  Variant read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Variant(
      id: fields[0] as String?,
      name: fields[1] as String?,
      typeId: fields[2] as String?,
      value: fields[3] as String?,
      priceChange: fields[4] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, Variant obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.typeId)
      ..writeByte(3)
      ..write(obj.value)
      ..writeByte(4)
      ..write(obj.priceChange);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VariantAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
