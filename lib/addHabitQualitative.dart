import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habit_tracker/habitsList.dart';
import 'main.dart';
import 'homepage.dart';
import 'habitsList.dart';

class addHabitQualitative extends StatefulWidget {
  addHabitQualitative({super.key});

  @override
  State<addHabitQualitative> createState() => _addHabitQualitativeState();
}

class _addHabitQualitativeState extends State<addHabitQualitative> {
  final List<Habits> habitData = Habits.habitsData;

  final _newHabitName = TextEditingController();

  void saveNewHabit() {
    setState(() {
      habitData.add(Habits(habitType: 1, habitName: _newHabitName.text));
    });
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
          style: GoogleFonts.ubuntu(
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
              saveNewHabit();
              /*Navigator.push(
                  context, MaterialPageRoute(builder: (context) => MyApp()));*/
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyApp(),
                  ));
            },
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 20, right: 20, bottom: 10),
            child: TextFormField(
              controller: _newHabitName,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Habit Name',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
