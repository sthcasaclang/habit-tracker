import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habit_tracker/habitsList.dart';
import 'package:hive/hive.dart';
import 'main.dart';
import 'homepage.dart';
//import 'habitsList.dart';
import 'database/habit_database.dart';

class addHabitQuantitative extends StatefulWidget {
  addHabitQuantitative({super.key});

  @override
  State<addHabitQuantitative> createState() => _addHabitQuantitativeState();
}

class _addHabitQuantitativeState extends State<addHabitQuantitative> {
  //final List<Habits> habitData = Habits.habitsData;
  final List<HabitDatabase> habitsData = HabitDatabase.habitsData;

  final _newHabitName = TextEditingController();

  /*void saveNewHabit() {
    setState(() {
      habitsData
          .add(HabitDatabase(habitType: 1, habitName: _newHabitName.text));
    });
  }*/

  late final Box habitDatabaseBox;

  @override
  void initState() {
    super.initState();
    // Get reference to an already opened box
    habitDatabaseBox = Hive.box('habit_database');
  }

  void saveNewHabitInBox() async {
    HabitDatabase newHabit = HabitDatabase(
      habitName: _newHabitName.text,
      habitType: 1,
    );
    habitDatabaseBox.add(newHabit);
    print('Info added to box! $_newHabitName');
  }

  String? _fieldValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Field can\'t be empty';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        centerTitle: true,
        title: Text(
          'Create New Habit',
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.normal,
              fontSize: 20,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.check_sharp,
              color: Colors.black,
            ),
            onPressed: () {
              saveNewHabitInBox();
              //saveNewHabit();
              /*Navigator.push(
                  context, MaterialPageRoute(builder: (context) => MyApp()));*/
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyApp(),
                  ));
            },
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 5),
            child: TextFormField(
              controller: _newHabitName,
              cursorColor: Colors.grey,
              decoration: const InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 3),
                    borderRadius: BorderRadius.all(Radius.circular(15.0))),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(15.0))),
                labelText: 'Habit Name',
                labelStyle: TextStyle(
                  color: Colors.black,
                  letterSpacing: 1.3,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
