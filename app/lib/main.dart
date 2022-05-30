import 'package:app/database/database.dart';
import 'package:app/model/plans.dart';
import 'package:app/model/user.dart';
import 'package:app/view/meus_chamados.dart';
import 'package:app/view/meus_pedidos.dart';
import 'package:app/view/readCSV.dart';
import 'package:app/view/switchScreen.dart';
import 'package:app/view/view_mapa.dart';
import 'package:flutter/material.dart';
import 'package:mongo_dart/mongo_dart.dart' as mongoDart;
import 'package:permission_handler/permission_handler.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:floating_pullup_card/floating_pullup_card.dart';
import 'package:flutter_placeholder_textlines/flutter_placeholder_textlines.dart';
import 'package:google_fonts/google_fonts.dart';

import 'model/installer.dart';

void main() async {
  AndroidGoogleMapsFlutter.useAndroidViewSurface = true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext buildContext) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ViewMapa(),
      // ),
    );
  }
}
