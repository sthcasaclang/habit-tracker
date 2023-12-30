class Habits {
  int habitId = 0;
  int habitType = 0;
  String habitName;

  Habits({required this.habitType, required this.habitName});

  static final List<Habits> habitsData = [
    Habits(habitType: 0, habitName: "Workout"),
    Habits(habitType: 0, habitName: "Sleep 8 Hours"),
    Habits(habitType: 0, habitName: "Read a Book"),
  ];
}
