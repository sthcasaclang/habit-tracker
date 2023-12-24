import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:habit_tracker/habitScreen.dart';
import 'addHabitType.dart';
import 'habitsList.dart';
import 'main.dart';

class HabitCard extends StatefulWidget {
  final String habitName;

  const HabitCard({super.key, required this.habitName});

  @override
  State<HabitCard> createState() => _HabitCardState();
}

class _HabitCardState extends State<HabitCard> {
  final List<Habits> habitData = Habits.habitsData;
  bool isButtonToggled = false;

  deleteHabit() async {
    print('removed!');
    habitData.removeWhere((element) {
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

  @override
  Widget build(BuildContext context) {
    print("Building HabitCard for habitName: ${widget.habitName}");
    setState(() {});
    return Padding(
      padding: const EdgeInsets.only(left: 6, right: 6, bottom: 1),
      child: Slidable(
        endActionPane: ActionPane(motion: const ScrollMotion(), children: [
          SlidableAction(
            padding: EdgeInsets.all(10),
            borderRadius: BorderRadius.circular(15),
            onPressed: (context) {},
            backgroundColor: Colors.grey,
            foregroundColor: Colors.white,
            icon: Icons.restore,
            //label: 'Revert',
          ),
          SlidableAction(
            borderRadius: BorderRadius.circular(15),
            onPressed: (context) {},
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
            icon: Icons.keyboard_double_arrow_right_rounded,
            //label: 'Skip',
          ),
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
                    builder: (context) =>
                        HabitScreen(habitName: widget.habitName)),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 255, 255, 255),
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(10.0),
              ),
            ),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(35),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(widget.habitName,
                        textAlign: TextAlign.left,
                        style: GoogleFonts.ubuntu(
                          textStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                            fontSize: 20,
                          ),
                        )),
                  ),
                ),
                Spacer(),
                SizedBox(
                  height: 50,
                  width: 50,
                  child: TextButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.add,
                      color: Colors.black,
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
