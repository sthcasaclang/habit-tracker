class Habits {
  String habitName;

  Habits({required this.habitName});

  static final List<Habits> habitsData = [
    Habits(habitName: "Workout"),
    Habits(habitName: "Sleep 8 Hours"),
    Habits(habitName: "Read a Book"),
  ];
}
