import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'habitsList.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:google_fonts/google_fonts.dart';
import 'main.dart';

class HabitScreen extends StatefulWidget {
  String habitName;

  HabitScreen({super.key, required this.habitName});

  @override
  State<HabitScreen> createState() => _HabitScreenState();
}

class _HabitScreenState extends State<HabitScreen> {
  final List<Habits> habitData = Habits.habitsData;

  deleteHabit() {
    habitData.removeWhere((element) {
      return element.habitName == widget.habitName;
    });

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const MyApp()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final PanelController panelController = PanelController();

    BorderRadiusGeometry radius = BorderRadius.only(
      topLeft: Radius.circular(24.0),
      topRight: Radius.circular(24.0),
    );

    return Material(
        child: SlidingUpPanel(
      controller: panelController,
      minHeight: 0,
      maxHeight: 190,
      backdropEnabled: true,
      borderRadius: radius,
      panel: Column(
        children: [
          Container(
            child: Expanded(
              child: ListView(
                padding: const EdgeInsets.all(8),
                children: <Widget>[
                  Container(
                      height: 50,
                      color: Colors.white,
                      child: Align(
                        child: Container(
                            padding: EdgeInsets.only(left: 20),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              widget.habitName,
                              style: GoogleFonts.ubuntu(
                                textStyle: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 20),
                              ),
                            )),
                      )),
                  Container(
                    height: 60,
                    width: double.infinity, // Make the button full width
                    child: TextButton.icon(
                      onPressed: () {
                        // Handle button press
                        // You can add your logic here
                      },
                      icon: Icon(
                        Icons.edit_outlined, // Replace with the desired icon
                        color: Colors.black,
                        size: 30,
                      ),
                      label: Row(
                        children: [
                          SizedBox(
                              width: 8), // Add some space between icon and text
                          Text(
                            'Edit',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    height: 60,
                    width: double.infinity,
                    child: TextButton.icon(
                      onPressed: () => showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          title: const Text(
                            'Delete',
                          ),
                          content: const Text(
                              'Are you sure you want to delete this habit?'),
                          actions: [
                            ButtonBar(
                              alignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 50,
                                  width: 135,
                                  margin: EdgeInsets.all(0),
                                  child: TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    style: TextButton.styleFrom(
                                      primary: Colors.black, // Text color
                                      backgroundColor: Colors.white,
                                      textStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15.0,
                                      ),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20.0, vertical: 10.0),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            8.0), // Set the border radius
                                      ),
                                    ),
                                    child: Text('Cancel'),
                                  ),
                                ),
                                Container(
                                  height: 50,
                                  width: 135,
                                  margin: EdgeInsets.all(0),
                                  child: TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                      deleteHabit();
                                    },
                                    style: TextButton.styleFrom(
                                      primary: Colors.white, // Text color
                                      backgroundColor: Colors.red,
                                      textStyle: TextStyle(
                                        fontSize: 15.0,
                                      ),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20.0, vertical: 10.0),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            8.0), // Set the border radius
                                      ),
                                    ),
                                    child: Text('Yes'),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      icon: Icon(
                        Icons
                            .delete_outline_rounded, // Replace with the desired icon
                        color: Colors.black,
                        size: 30,
                      ),
                      label: Row(
                        children: [
                          SizedBox(
                              width: 8), // Add some space between icon and text
                          Text(
                            'Delete',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
        /*children: [
          Container(
            decoration: BoxDecoration(borderRadius: radius),
            height: 50,
            padding: EdgeInsets.only(left: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text("widget.habitName",
                  textAlign: TextAlign.left,
                  style: GoogleFonts.ubuntu(
                    textStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 15,
                    ),
                  )),
            ),
          ),
          Container(
            child: ListView(
              padding: const EdgeInsets.all(8),
              children: <Widget>[
                Container(
                  height: 50,
                  color: Colors.amber[600],
                  child: const Center(child: Text('Entry A')),
                ),
              ],
            ),
          ),
        ],*/
      ),
      body: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          centerTitle: true,
          title: Text(
            widget.habitName,
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
                Icons.more_vert_rounded,
                color: Colors.black,
              ),
              onPressed: () {
                panelController.open();

                /*Navigator.push(
                  context, MaterialPageRoute(builder: (context) => MyApp()));*/
                /*Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyApp(),
                  ));*/
              },
            ),
          ],
          // popup menu button
          /*actions: [
              PopupMenuButton<int>(
                itemBuilder: (context) => [
                  // popupmenu item 1
                  PopupMenuItem(
                    value: 1,
                    // row has two child icon and text.
                    child: Row(
                      children: [
                        Icon(Icons.star),
                        SizedBox(
                          // sized box with width 10
                          width: 10,
                        ),
                        Text("Get The App")
                      ],
                    ),
                  ),
                  // popupmenu item 2
                  PopupMenuItem(
                    value: 2,
                    // row has two child icon and text
                    child: Row(
                      children: [
                        Icon(Icons.chrome_reader_mode),
                        SizedBox(
                          // sized box with width 10
                          width: 10,
                        ),
                        Text("About")
                      ],
                    ),
                  ),
                ],
                offset: Offset(0, 100),
                color: Colors.grey,
                elevation: 2,
              ),
            ],*/
        ),
        backgroundColor: Colors.white,
        body: Card(),
      ),
    ));
  }
}