import 'package:hive/hive.dart';
part 'habit_database.g.dart';

final databaseBox = Hive.box("habit_database");

@HiveType(typeId: 0)
class HabitDatabase {
  static List<HabitDatabase> habitsData = [
    HabitDatabase(habitName: 'Sample Habit', habitType: 0)
  ];

  @HiveType(typeId: 0)
  final String habitName;

  @HiveType(typeId: 1)
  final int habitType;

  HabitDatabase({required this.habitName, required this.habitType});

  createNewDatabase() {
    habitsData = [HabitDatabase(habitName: "Sample Habit 0", habitType: 0)];
  }
}
