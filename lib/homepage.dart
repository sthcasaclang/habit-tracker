import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(left: 20, right: 20, bottom: 15),
              child: Text(
                'Hello, Seth',
                style: GoogleFonts.ubuntu(
                  textStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 35),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
              height: 80,
              width: 360,
              child: ElevatedButton.icon(
                icon: Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 30.0,
                ),
                label: Text(''),
                onPressed: () {
                  print('');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 0, 0, 0),
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
            Container(
                child: Expanded(
              child: ListView.builder(
                itemCount: 20,
                itemBuilder: (context, position) {
                  return Container(
                    margin: const EdgeInsets.only(left: 5, right: 5),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          position.toString(),
                          style: TextStyle(fontSize: 22.0),
                        ),
                      ),
                    ),
                  );
                },
              ),
            )),
          ],
        ),
      ),
    );
  }
}
