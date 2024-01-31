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
        progressTracker: fields[0] as int?,
        habitFinished: fields[1] as bool?,
        habitName: fields[2] as String?,
        habitType: fields[3] as int?,
        habitQuestion: fields[4] as String?,
        habitTarget: fields[5] as int?,
        habitFrequency: fields[6] as String?,
        habitUnit: fields[7] as String?,
        startDate: fields[8] as String?,
      );
    } else {
      // Handle the case where expected fields are not present
      throw HiveError('Invalid data format for HabitDatabase');
    }
  }

  @override
  void write(BinaryWriter writer, HabitDatabase obj) {
    writer.writeByte(10); // Number of fields

    // Write the fields to the binary writer
    writer.writeByte(0);
    writer.write(obj.progressTracker);

    writer.writeByte(1);
    writer.write(obj.habitFinished);

    writer.writeByte(2);
    writer.write(obj.habitName);

    writer.writeByte(3);
    writer.write(obj.habitType);

    writer.writeByte(4);
    writer.write(obj.habitQuestion);

    writer.writeByte(5);
    writer.write(obj.habitTarget);

    writer.writeByte(6);
    writer.write(obj.habitFrequency);

    writer.writeByte(7);
    writer.write(obj.habitUnit);

    writer.writeByte(8);
    writer.write(obj.startDate);
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
