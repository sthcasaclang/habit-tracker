import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
//import 'habitsList.dart';
import '/screens/add_habit/addHabitType.dart';
import 'habitCard.dart';
import '/screens/add_habit/addHabitType.dart';
import '/database/habit_database.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //final List<Habits> habitData = Habits.habitsData;

  late final Box habitDatabaseBox;

  @override
  void initState() {
    super.initState();
    // Get reference to an already opened box
    habitDatabaseBox = Hive.box('habit_database');
  }

  final List<HabitDatabase> habitsData = HabitDatabase.habitsData;

  @override
  Widget build(BuildContext context) {
    print("homepage habitData: ${habitDatabaseBox.values.toList()}");

    return Scaffold(
        backgroundColor: Colors.white,
        body: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overScroll) {
            overScroll.disallowIndicator();
            return true;
          },
          child: Container(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(left: 20, right: 20, bottom: 5),
                  child: Text(
                    'Hello, User',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 30),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 0, right: 0, bottom: 10),
                  height: 80,
                  width: 360,
                  child: ElevatedButton.icon(
                    icon: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 30.0,
                    ),
                    label: const Text(''),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AddHabitType()),
                      );

                      /*showDialog(
                          context: context,
                          builder: (builder) {
                            return AddHabitDialog();
                          });
                      addHabit(addButton);*/
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 0, 0, 0),
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
                Container(
                    child: Expanded(
                  child: ListView.builder(
                    itemCount: habitDatabaseBox.length,
                    itemBuilder: (context, index) {
                      var habit =
                          habitDatabaseBox.getAt(index) as HabitDatabase;
                      return HabitCard(
                        index: index,
                        progressTracker: habit.progressTracker,
                        habitFinished: habit.habitFinished,
                        habitName: habit.habitName,
                        habitType: habit.habitType,
                        habitQuestion: habit.habitQuestion,
                        habitTarget: habit.habitTarget,
                        habitFrequency: habit.habitFrequency,
                        habitUnit: habit.habitUnit,
                      );
                    },
                    /*itemCount: habitDatabaseBox.length,
                    itemBuilder: (context, index) {
                      habitDatabaseBox.getAt(index) as HabitDatabase;
                      return HabitCard(
                          habitName: HabitDatabase.habitsData[index].habitName);
                    }, {
                  return HabitCard(
                    habitName: habitData[index].habitName,
                  );
                },*/
                  ),
                )),
                /*Container(
                margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                height: 80,
                width: 360,
                child: Expanded(
                  child: ElevatedButton.icon(
                    icon: Icon(
                      Icons.remove,
                      color: Colors.white,
                      size: 30.0,
                    ),
                    label: Text(''),
                    onPressed: () {
                      print('');
                      int addButton = this.add -= 1;

                      addHabit(addButton);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 0, 0, 0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                )),*/
              ],
            ),
          ),
        ));
  }
}
