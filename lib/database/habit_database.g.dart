// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'habit_database.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HabitDatabaseAdapter extends TypeAdapter<HabitDatabase> {
  @override
  final int typeId = 0;

  @override
  HabitDatabase read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HabitDatabase();
  }

  @override
  void write(BinaryWriter writer, HabitDatabase obj) {
    writer.writeByte(0);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HabitDatabaseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
