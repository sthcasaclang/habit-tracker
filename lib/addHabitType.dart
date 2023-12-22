import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habit_tracker/addHabitQualitative.dart';
import 'package:habit_tracker/addHabitQuantitative.dart';

class AddHabitType extends StatelessWidget {
  const AddHabitType({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Add Habit',
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
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.close_sharp,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            child: Container(
              margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
              height: 80,
              width: 360,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => addHabitQualitative()),
                  );
                },
                child: Text('Yes or No',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.ubuntu(
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 20,
                      ),
                    )),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Container(
              margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
              height: 80,
              width: 360,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const addHabitQuantitative()),
                  );
                },
                child: Text('Measurable',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.ubuntu(
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 20,
                      ),
                    )),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
