import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:habit_tracker/database/habit_database.dart';
import 'package:hive/hive.dart';
import 'package:google_fonts/google_fonts.dart';
import 'main.dart';

class HabitScreenEditQuantitative extends StatefulWidget {
  final int index;
  final int? progressTracker;
  final bool? habitFinished;
  final String? habitName;
  final int? habitType;
  final String? habitQuestion;
  final int? habitTarget;
  final String? habitFrequency;
  final String? habitUnit;

  const HabitScreenEditQuantitative(
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
  State<HabitScreenEditQuantitative> createState() =>
      _HabitScreenEditQuantitativeState();
}

class _HabitScreenEditQuantitativeState
    extends State<HabitScreenEditQuantitative> {
  late final Box habitDatabaseBox;
  late final TextEditingController _habitName;
  late final TextEditingController _question;
  String? _frequency;
  late final TextEditingController _target;
  late final TextEditingController _unit;

  @override
  void initState() {
    super.initState();
    // Get reference to an already opened box
    habitDatabaseBox = Hive.box('habit_database');
    _habitName =
        TextEditingController(text: widget.habitName ?? "Default Value");
    _question =
        TextEditingController(text: widget.habitQuestion ?? "Default Question");
    _target = TextEditingController(
        text: widget.habitTarget?.toString() ?? "Default Value");
    _unit = TextEditingController(text: widget.habitUnit ?? "Unit");
  }

  void updateHabitInformationInBox(
      int index,
      bool? habitFinished,
      int? progressTracker,
      String? name,
      int? type,
      String? question,
      int? target,
      String? frequency,
      String? unit) {
    int targetValue = int.tryParse(_target.text) ?? 0;

    HabitDatabase updateInformation = HabitDatabase(
        habitFinished: habitFinished,
        progressTracker: progressTracker,
        habitName: _habitName.text,
        habitType: type,
        habitQuestion: _question.text,
        habitTarget: targetValue,
        habitFrequency: _frequency,
        habitUnit: unit);
    habitDatabaseBox.putAt(index, updateInformation);
    print('Habit Information Updated');
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
              updateHabitInformationInBox(
                  widget.index,
                  widget.habitFinished,
                  widget.progressTracker,
                  widget.habitName,
                  widget.habitType,
                  widget.habitQuestion,
                  widget.habitTarget,
                  widget.habitFrequency,
                  widget.habitUnit);
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
                    borderSide: BorderSide(color: Colors.grey, width: 3),
                    borderRadius: BorderRadius.all(Radius.circular(8.0))),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 2),
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
                    borderSide: BorderSide(color: Colors.grey, width: 3),
                    borderRadius: BorderRadius.all(Radius.circular(8.0))),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 2),
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
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 207, 207, 207),
                            width: 3),
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 2),
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
                        borderSide: BorderSide(color: Colors.grey, width: 3),
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 2),
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
                    borderSide: BorderSide(color: Colors.grey, width: 3),
                    borderRadius: BorderRadius.all(Radius.circular(8.0))),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 2),
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
