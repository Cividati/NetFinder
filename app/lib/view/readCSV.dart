import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'package:csv/csv.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'readCSV',
      home: ReadCSV(),
    );
  }
}

class ReadCSV extends StatefulWidget {
  const ReadCSV({Key? key}) : super(key: key);

  @override
  _ReadCSVState createState() => _ReadCSVState();
}

class _ReadCSVState extends State<ReadCSV> {
  List<List<dynamic>> _data = [];

  // This function is triggered when the floating button is pressed
  void _loadCSV() async {
    final _rawData = await rootBundle.loadString("assets/SIMET.csv");

    List<List<dynamic>> _listData =
        const CsvToListConverter().convert(_rawData);

    setState(() {
      _data = _listData;
      print('length: ' + _data.length.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    _loadCSV();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        centerTitle: true,
        title: Text("Read CSV",
            style: GoogleFonts.firaSans(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(50, 50, 50, 1.0))),
      ),
      // Display the contents from the CSV file
      body: ListView.builder(
        itemCount: _data.length,
        itemBuilder: (_, index) {
          return Card(
            margin: const EdgeInsets.all(3),
            color: index == 0 ? Colors.amber : Colors.white,
            child: ListTile(
              leading: Text(_data[index][5].toString()),
              title: Text(_data[index][7].toString()),
              trailing: Text(_data[index][8].toString()),
            ),
          );
        },
      ),

      // floatingActionButton: FloatingActionButton(
      //     child: const Icon(Icons.add), onPressed: _loadCSV),
    );
  }
}
