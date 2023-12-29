import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:habit_tracker/habitScreen.dart';
import 'package:hive/hive.dart';
import 'addHabitType.dart';
//import 'habitsList.dart';
import 'main.dart';
import 'database/habit_database.dart';

class HabitCard extends StatefulWidget {
  final int index;
  final int? progressTracker;
  final bool? habitFinished;
  final String? habitName;
  final int? habitType;
  final String? habitQuestion;
  final int? habitTarget;
  final String? habitFrequency;
  final String? habitUnit;

  const HabitCard(
      {super.key,
      required this.index,
      required this.habitFinished,
      required this.progressTracker,
      required this.habitName,
      required this.habitType,
      required this.habitQuestion,
      required this.habitTarget,
      required this.habitFrequency,
      required this.habitUnit});

  @override
  State<HabitCard> createState() => _HabitCardState();
}

class _HabitCardState extends State<HabitCard> {
  //final List<Habits> habitData = Habits.habitsData;

  final List<HabitDatabase> habitsData = HabitDatabase.habitsData;

  bool isButtonToggled = false;
  bool canButtonBePressed = true;

  int finished = 0;

  late final Box habitDatabaseBox;

  @override
  void initState() {
    super.initState();
    // Get reference to an already opened box
    habitDatabaseBox = Hive.box('habit_database');
  }

  deleteHabit() async {
    print('removed!');
    habitsData.removeWhere((element) {
      return element.habitName == widget.habitName;
    });

    // Add your desired delay duration, for example, 2 seconds
    await Future.delayed(const Duration(milliseconds: 300));

    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => const MyApp(),
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),
    );
  }

  progressTracker(
      int index,
      bool? habitFinished,
      int? progressTracker,
      String? name,
      int? type,
      String? question,
      int? target,
      String? frequency,
      String? unit) {
    int updatingProgress = 0;

    if (progressTracker == null) {
      HabitDatabase changeProgressTrackerNullValue = HabitDatabase(
          habitFinished: habitFinished,
          progressTracker: 1,
          habitName: name,
          habitType: type,
          habitQuestion: question,
          habitTarget: target,
          habitFrequency: frequency,
          habitUnit: unit);
      habitDatabaseBox.putAt(index, changeProgressTrackerNullValue);
      print('progressTracker not null');
      print("progressTracker = 1");
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation1, animation2) => const MyApp(),
          transitionDuration: Duration.zero,
          reverseTransitionDuration: Duration.zero,
        ),
      );
    } else {
      updatingProgress = progressTracker + 1;
      HabitDatabase incrementProgress = HabitDatabase(
          habitFinished: habitFinished,
          progressTracker: updatingProgress,
          habitName: name,
          habitType: type,
          habitQuestion: question,
          habitTarget: target,
          habitFrequency: frequency,
          habitUnit: unit);
      habitDatabaseBox.putAt(index, incrementProgress);
      print('value incremented');
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation1, animation2) => const MyApp(),
          transitionDuration: Duration.zero,
          reverseTransitionDuration: Duration.zero,
        ),
      );
    }
  }

  isItFinished(
      int index,
      bool? habitFinished,
      int? progressTracker,
      String? name,
      int? type,
      String? question,
      int? target,
      String? frequency,
      String? unit) {
    if (progressTracker == null) {
      print("1st case: Not done yet");
    } else if (progressTracker >= target!) {
      HabitDatabase isFinished = HabitDatabase(
          habitFinished: true,
          progressTracker: progressTracker,
          habitName: name,
          habitType: type,
          habitQuestion: question,
          habitTarget: target,
          habitFrequency: frequency,
          habitUnit: unit);
      habitDatabaseBox.putAt(index, isFinished);
      finished = finished + 1;
      print('Finished +  $finished');
    } else {
      print("2nd case: Not done yet. count: $progressTracker");
    }
  }

  resetHabitProgress(
      int index,
      bool? habitFinished,
      int? progressTracker,
      String? name,
      int? type,
      String? question,
      int? target,
      String? frequency,
      String? unit) async {
    print("fuckyou");
    if (habitFinished == true) {
      // If habit was finished, decrement the finished count
      finished = finished - 2;
      print("habit resetted = $finished");
    }

    // Add your desired delay duration, for example, 2 seconds
    await Future.delayed(const Duration(milliseconds: 250));

    HabitDatabase resetHabitProgress = HabitDatabase(
      habitFinished: false,
      progressTracker: 0,
      habitName: name,
      habitType: type,
      habitQuestion: question,
      habitTarget: target,
      habitFrequency: frequency,
      habitUnit: unit,
    );
    habitDatabaseBox.putAt(index, resetHabitProgress);

    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => MyApp(),
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    isItFinished(
        widget.index,
        widget.habitFinished,
        widget.progressTracker,
        widget.habitName,
        widget.habitType,
        widget.habitQuestion,
        widget.habitTarget,
        widget.habitFrequency,
        widget.habitUnit);

    print('HabitCard - habitName: ${widget.habitName}');
    return Padding(
      padding: const EdgeInsets.only(left: 6, right: 6, bottom: 1),
      child: Slidable(
        endActionPane: ActionPane(motion: const ScrollMotion(), children: [
          SlidableAction(
            padding: EdgeInsets.all(10),
            borderRadius: BorderRadius.circular(15),
            onPressed: (context) {
              resetHabitProgress(
                  widget.index,
                  widget.habitFinished,
                  widget.progressTracker,
                  widget.habitName,
                  widget.habitType,
                  widget.habitQuestion,
                  widget.habitTarget,
                  widget.habitFrequency,
                  widget.habitUnit);
              setState(() {
                // Toggle the button state
                isButtonToggled = !isButtonToggled;
              });
            },
            backgroundColor: Colors.grey,
            foregroundColor: Colors.white,
            icon: Icons.restore,
            //label: 'Revert',
          ),
          /*SlidableAction(
            borderRadius: BorderRadius.circular(15),
            onPressed: (context) {},
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
            icon: Icons.keyboard_double_arrow_right_rounded,
            //label: 'Skip',
          ),*/
        ]),
        /*startActionPane: ActionPane(motion: const ScrollMotion(), children: [
          SlidableAction(
            borderRadius: BorderRadius.circular(15),
            onPressed: (context) {
              deleteHabit();
              setState(() {
                // Toggle the button state
                isButtonToggled = !isButtonToggled;
              });
            },
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.delete_outline_sharp,

            //label: 'Skip',
          ),
        ]),*/
        child: Padding(
          padding: EdgeInsets.all(5),
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HabitScreen(
                          index: widget.index,
                          progressTracker: widget.progressTracker,
                          habitFinished: widget.habitFinished,
                          habitName: widget.habitName,
                          habitType: widget.habitType,
                          habitQuestion: widget.habitQuestion,
                          habitTarget: widget.habitTarget,
                          habitFrequency: widget.habitFrequency,
                          habitUnit: widget.habitUnit,
                        )),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: finished == 0
                  ? Colors
                      .white // Set your default color when habit is not finished
                  : Colors.green,
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(10.0),
              ),
            ),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(30),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      widget.habitName ?? "Default Value",
                      textAlign: TextAlign.left,
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: finished == 0 ? Colors.black : Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 15),
                      ),
                    ),
                  ),
                ),
                Spacer(),
                SizedBox(
                  height: 50,
                  width: 50,
                  child: TextButton(
                    onPressed: canButtonBePressed
                        ? () {
                            print('canButtonBePressed: $canButtonBePressed');
                            if (finished == 0) {
                              progressTracker(
                                  widget.index,
                                  widget.habitFinished,
                                  widget.progressTracker,
                                  widget.habitName,
                                  widget.habitType,
                                  widget.habitQuestion,
                                  widget.habitTarget,
                                  widget.habitFrequency,
                                  widget.habitUnit);
                            }
                          }
                        : null,
                    child: finished == 0
                        ? Icon(
                            Icons.add,
                            color: Colors.black,
                          )
                        : Icon(
                            Icons
                                .check, // Use an appropriate icon for disabled state
                            color: Colors.white,
                          ),
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      foregroundColor:
                          finished == 0 ? Colors.grey : Colors.transparent,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
