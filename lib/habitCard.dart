import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HabitCard extends StatelessWidget {
  final String habitName;

  const HabitCard({super.key, required this.habitName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 6, right: 6, bottom: 1),
      child: Container(
        margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
        height: 80,
        width: 360,
        child: Expanded(
          child: ElevatedButton(
            onPressed: () {
              print("");
            },
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
