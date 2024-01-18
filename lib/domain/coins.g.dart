// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coins.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CoinsAdapter extends TypeAdapter<Coins> {
  @override
  final int typeId = 2;

  @override
  Coins read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Coins(
      user: fields[0] as String,
      coin: fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Coins obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.user)
      ..writeByte(1)
      ..write(obj.coin);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CoinsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
