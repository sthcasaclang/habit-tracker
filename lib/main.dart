import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'homepage.dart';
import 'sidebar.dart';
import 'habitsList.dart';

void main() {
  print("MyApp Habits List: ${Habits.habitsData}");
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    setState(() {});
    return new WillPopScope(
        onWillPop: () async => false,
        child: MaterialApp(
            home: Scaffold(
          appBar: AppBar(
            iconTheme: const IconThemeData(color: Colors.black, size: 35),
            centerTitle: true,
            title: Text(
              'Habit Tracker',
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
            ),
            backgroundColor: Colors.white,
            elevation: 0,
          ),
          endDrawer: SideNavigationBar(),
          body: HomePage(),
        )));
  }
}
/*
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    print("homepage habitData: $habitData");
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black, size: 35),
        centerTitle: true,
        title: Text(
          'Habit Tracker',
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
      ),
      endDrawer: SideNavigationBar(),
      body: HomePage(),
    ));
  }
}
*/

