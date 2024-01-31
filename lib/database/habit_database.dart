import 'package:habit_tracker/datetime/date_time.dart';
import 'package:hive/hive.dart';
part 'habit_database.g.dart';

final databaseBox = Hive.box("habit_database");

@HiveType(typeId: 0)
class HabitDatabase {
  static List<HabitDatabase> habitsData = [];

  @HiveType(typeId: 0)
  int? progressTracker;

  @HiveType(typeId: 1)
  bool? habitFinished;

  @HiveType(typeId: 2)
  String? habitName;

  @HiveType(typeId: 3)
  int? habitType;

  @HiveType(typeId: 4)
  String? habitQuestion;

  @HiveType(typeId: 5)
  int? habitTarget;

  @HiveType(typeId: 6)
  String? habitFrequency;

  @HiveType(typeId: 7)
  String? habitUnit;

  @HiveType(typeId: 8)
  String? startDate;

  HabitDatabase({
    this.habitFinished,
    this.progressTracker,
    this.habitName,
    this.habitType,
    this.habitQuestion,
    this.habitTarget,
    this.habitFrequency,
    this.habitUnit,
    this.startDate,
  });

  @override
  String toString() {
    return 'HabitDatabase(progressTracker: $progressTracker, habitFinished: $habitFinished, habitName: $habitName, habitType: $habitType, habitQuestion: $habitQuestion, habitTarget: $habitTarget, habitFrequency: $habitFrequency, habitUnit: $habitUnit)';
  }

  createNewDatabase() async {
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

    //databaseBox.put("habitList", "CURRENT_HABIT_LIST");

    //databaseBox.put("HABIT_LIST", habitsData);

    await databaseBox.put(startDate, todaysDateFormatted());
  }

  void loadData() {
    // if it's a new day, get habit list from database
    if (databaseBox.get(todaysDateFormatted()) == null) {
      habitsData = databaseBox.get("CURRENT_HABIT_LIST");
      // set all habit completed to false since it's a new day
      for (int i = 0; i < habitsData.length; i++) {
        habitsData[i].progressTracker = 0;
        habitsData[i].habitFinished = false;
      }
    }
    // if it's not a new day, load todays list
    else {
      habitsData = databaseBox.get(todaysDateFormatted());
    }
  }
}
