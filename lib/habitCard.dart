import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class HabitCard extends StatelessWidget {
  final String habitName;

  const HabitCard({super.key, required this.habitName});

  @override
  Widget build(BuildContext context) {
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
          )
        ]),
        child: Padding(
          padding: EdgeInsets.all(5),
          child: ElevatedButton(
            onPressed: () {
              print("");
            },
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(35),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(habitName,
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
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 255, 255, 255),
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(10.0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
