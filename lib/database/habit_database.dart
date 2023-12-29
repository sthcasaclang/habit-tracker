import 'package:hive/hive.dart';
part 'habit_database.g.dart';

final databaseBox = Hive.box("habit_database");

@HiveType(typeId: 0)
class HabitDatabase {
  static List<HabitDatabase> habitsData = [];

  @HiveType(typeId: 0)
  final int? progressTracker;

  @HiveType(typeId: 1)
  final bool? habitFinished;

  @HiveType(typeId: 2)
  final String? habitName;

  @HiveType(typeId: 3)
  final int? habitType;

  @HiveType(typeId: 4)
  final String? habitQuestion;

  @HiveType(typeId: 5)
  final int? habitTarget;

  @HiveType(typeId: 6)
  final String? habitFrequency;

  @HiveType(typeId: 7)
  final String? habitUnit;

  HabitDatabase(
      {this.habitFinished,
      this.progressTracker,
      this.habitName,
      this.habitType,
      this.habitQuestion,
      this.habitTarget,
      this.habitFrequency,
      this.habitUnit});

  @override
  String toString() {
    return 'HabitDatabase(progressTracker: $progressTracker, habitFinished: $habitFinished, habitName: $habitName, habitType: $habitType, habitQuestion: $habitQuestion, habitTarget: $habitTarget, habitFrequency: $habitFrequency, habitUnit: $habitUnit)';
  }

  createNewDatabase() {
    habitsData = [
      HabitDatabase(
          progressTracker: 0,
          habitName: "Sample Habit 0",
          habitType: 0,
          habitQuestion: "Sample Question",
          habitTarget: 0,
          habitFrequency: "Sample Frequency",
          habitUnit: "Sample Unit")
    ];
  }
}
