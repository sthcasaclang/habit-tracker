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
    if (fields.containsKey(0) && fields.containsKey(1)) {
      return HabitDatabase(
        habitName: fields[0] as String?,
        habitType: fields[1] as int?,
      );
    } else {
      // Handle the case where expected fields are not present
      throw HiveError('Invalid data format for HabitDatabase');
    }
  }

  @override
  void write(BinaryWriter writer, HabitDatabase obj) {
    writer.writeByte(2); // Number of fields

    // Write the fields to the binary writer
    writer.writeByte(0);
    writer.write(obj.habitName);

    writer.writeByte(1);
    writer.write(obj.habitType);
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
