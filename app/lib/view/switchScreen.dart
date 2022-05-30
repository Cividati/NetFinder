// main.dart
import 'package:app/config/Constants.dart';
import 'package:app/view/readCSV.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class SwitchScreen extends StatelessWidget {
  const SwitchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // Remove the debug banner
        debugShowCheckedModeBanner: false,
        title: 'Kindacode.com',
        home: HomePage(),
        theme: ThemeData(
          // Define the default brightness and colors.
          brightness: Brightness.light,
          // primaryColor: Colors.lightBlue[800],

          // Define the default font family.
          fontFamily: 'Consolas',

          // Define the default `TextTheme`. Use this to specify the default
          // text styling for headlines, titles, bodies of text, and more.
          textTheme: const TextTheme(
            // headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
            headline6: TextStyle(
              fontSize: 36.0,
            ),
            // bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
          ),
        ));
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Switch Screen'),
      // ),
      body: const Center(),
      floatingActionButton: SpeedDial(
          icon: Icons.arrow_circle_right_outlined,
          backgroundColor: Constants().collorLight,
          children: [
            SpeedDialChild(
              child: const Icon(Icons.table_chart),
              label: 'Read CSV',
              backgroundColor: Constants().collorLight,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ReadCSV()),
                );
              },
            ),
            SpeedDialChild(
              child: const Icon(Icons.account_box),
              label: 'User',
              backgroundColor: Constants().collorLight,
              onTap: () {/* Do something */},
            ),
            SpeedDialChild(
              child: const Icon(Icons.chat),
              label: 'Message',
              backgroundColor: Constants().collorLight,
              onTap: () {/* Do something */},
            ),
          ]),
    );
  }
}
