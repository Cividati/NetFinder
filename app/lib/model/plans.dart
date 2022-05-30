// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Plans {
  num id;
  String isp;
  num data_capacity;
  num download_speed;
  num upload_speed;
  String description;
  num price_per_month;
  String type_of_internet;
  LatLng pos;
  Icon icon = const Icon(Icons.help_outline, color: Colors.black54, size: 40.0);

  Plans(
      this.id,
      this.isp,
      this.data_capacity,
      this.download_speed,
      this.upload_speed,
      this.description,
      this.price_per_month,
      this.type_of_internet,
      this.pos) {
    switch(type_of_internet)
    {
      case "sat":
        icon = const Icon(Icons.satellite_alt, color: Colors.black54, size: 40.0);
        break;

      case "fiber":
        icon = const Icon(Icons.cable, color: Colors.black54, size: 40.0);
        break;

      case "radio":
        icon = const Icon(Icons.radio, color: Colors.black54, size: 40.0);
        break;

      case "adsl":
        icon = const Icon(Icons.import_export, color: Colors.black54, size: 40.0);
        break;

      case "dialup":
        icon = const Icon(Icons.question_mark, color: Colors.black54, size: 40.0);
        break;

      default:
        icon = const Icon(Icons.help_outline, color: Colors.black54, size: 40.0);
        break;
    }
  }

  @override
  String toString() {
    String ret = '$id $isp $data_capacity $download_speed $upload_speed';
    return ret;
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'isp': isp,
      'data_capacity': data_capacity,
      'download_speed': download_speed,
      'upload_speed': upload_speed,
      'description': description,
      'price_per_month': price_per_month,
      'type_of_internet': type_of_internet,
      'pos': pos
    };
  }
}

class PlansParser {
  List plans = [];

  Future<File> get _localFile async {
    return File('assets/plans.json');
  }

  Future<dynamic> readJson() async {
    try {
      final file = await rootBundle.loadString("assets/plans.json");

      // Read the file
      List<dynamic> tempList = jsonDecode(file);
      for (var i in tempList) {
        Plans p = Plans(
            i['id'],
            i['isp'],
            i['data_capacity'],
            i['download_speed'],
            i['upload_speed'],
            i['description'],
            i['price_per_month'],
            i['type_of_internet'],
            LatLng(i['lat'], i['lon']));
        plans.add(p);
        print(p.toString());
      }
      // print('length: ' + tempList.length.toString());
      return plans;
      //return int.parse(contents);
    } catch (e) {
      print("error: " + e.toString());
      // If encountering an error, return 0
      return 0;
    }
  }
}
