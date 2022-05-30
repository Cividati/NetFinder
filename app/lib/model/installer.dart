// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'dart:io';

class Installer {
  num id;
  String name;
  num rating;
  num price_per_km;
  num lat;
  num lng;
  num phone = 999085566;
  String email = 'installer@samplemail.com';

  Installer(
      this.id, this.name, this.rating, this.price_per_km, this.lat, this.lng);

  @override
  String toString() {
    // TODO: implement toString
    String ret = '$id $name $rating';
    return ret;
  }
}

class InstallersParser {
  List installers = [];

  Future<File> get _localFile async {
    return File('assets/installers.json');
  }

  Future<dynamic> readJson() async {
    try {
      final file = await _localFile;

      // Read the file
      final contents = await file.readAsString();
      List<dynamic> tempList = jsonDecode(contents.toString());
      for (var i in tempList) {
        Installer installer = Installer(i['id'], i['name'], i['rating'],
            i['price_per_km'], i['lat'], i['lng']);
        installers.add(installer);
        print(installer.toString());
      }
      // print('length: ' + tempList.length.toString());
      return installers;
      //return int.parse(contents);
    } catch (e) {
      print("error: " + e.toString());
      // If encountering an error, return 0
      return 0;
    }
  }
}
