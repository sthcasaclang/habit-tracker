import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '/screens/habitsList.dart';
import 'package:hive/hive.dart';
import '/main.dart';
import '/screens/homepage/homepage.dart';
//import 'habitsList.dart';
import '/database/habit_database.dart';

class addHabitQuantitative extends StatefulWidget {
  addHabitQuantitative({super.key});

  @override
  State<addHabitQuantitative> createState() => _addHabitQuantitativeState();
}

class _addHabitQuantitativeState extends State<addHabitQuantitative> {
  //final List<Habits> habitData = Habits.habitsData;
  final List<HabitDatabase> habitsData = HabitDatabase.habitsData;

  final _habitName = TextEditingController();
  final _question = TextEditingController();
  String? _frequency;
  final _target = TextEditingController();
  final _unit = TextEditingController();

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
    int targetValue = int.tryParse(_target.text) ?? 0;

    HabitDatabase newHabit = HabitDatabase(
      habitName: _habitName.text,
      habitType: 1,
      habitQuestion: _question.text,
      habitTarget: targetValue,
      habitFrequency: _frequency,
      habitUnit: _unit.text,
    );
    habitDatabaseBox.add(newHabit);
    print('Info added to box! $_habitName');
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
            margin: EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 5),
            child: TextFormField(
              controller: _habitName,
              cursorColor: Colors.grey,
              decoration: const InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(8.0))),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(8.0))),
                labelText: 'Habit Name',
                labelStyle: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 5),
            child: TextFormField(
              controller: _question,
              cursorColor: Colors.grey,
              decoration: const InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(8.0))),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(8.0))),
                labelText: 'Question',
                hintText: "e.g. How many hours did you sleep today?",
                labelStyle: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Container(
              child: Row(
            children: [
              Expanded(
                child: Container(
                  padding:
                      EdgeInsets.only(left: 10, right: 5, bottom: 10, top: 5),
                  child: TextFormField(
                    controller: _target,
                    cursorColor: Colors.grey,
                    decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                      labelText: 'Target',
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              //SizedBox(width: 1),
              Expanded(
                child: Container(
                  padding:
                      EdgeInsets.only(left: 5, right: 10, bottom: 10, top: 5),
                  child: DropdownButtonFormField<String>(
                    items: <String>['Every day', 'Every week', 'Every month']
                        .map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _frequency = newValue; //
                      });
                    },
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.only(
                          left: 13, right: 7, bottom: 18, top: 18),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                      hintText: "Frequency",
                      hintStyle: TextStyle(
                        color: Colors.black,
                      ),
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )),
          Container(
            margin: EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 5),
            child: TextFormField(
              controller: _unit,
              cursorColor: Colors.grey,
              decoration: const InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(8.0))),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(8.0))),
                labelText: 'Unit',
                hintText: "e.g. hours",
                labelStyle: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
