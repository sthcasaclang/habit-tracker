import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'addHabitQualitative.dart';
import 'addHabitQuantitative.dart';

class AddHabitType extends StatelessWidget {
  const AddHabitType({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Create New Habit",
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.normal,
                fontSize: 20),
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
            margin: EdgeInsets.only(left: 0, right: 0, top: 5, bottom: 5),
            alignment: Alignment.center,
            child: Text("How would you like to evaluate your progress?",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 18)),
          ),
          Container(
            alignment: Alignment.center,
            child: Container(
              margin: const EdgeInsets.all(10),
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
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 15,
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
            margin: EdgeInsets.only(left: 20, right: 20),
            alignment: Alignment.center,
            child: Text(
                "e.g. Did you practice programming? Did you read a book?",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                    fontSize: 12)),
          ),
          Container(
            alignment: Alignment.center,
            child: Container(
              margin: const EdgeInsets.all(10),
              height: 80,
              width: 360,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => addHabitQuantitative()),
                  );
                },
                child: Text('Numerical Value',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 15,
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
            margin: EdgeInsets.only(left: 20, right: 20),
            alignment: Alignment.center,
            child: Text(
                "e.g. How many times did you read today? How many hours did you sleep?",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                    fontSize: 12)),
          ),
        ],
      ),
    );
  }
}
