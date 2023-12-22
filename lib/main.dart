import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'homepage.dart';
import 'sidebar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
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
