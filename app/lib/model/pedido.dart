import 'package:app/config/Constants.dart';
import 'package:app/model/installer.dart';
import 'package:app/model/plans.dart';
import 'package:app/model/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mongo_dart/mongo_dart.dart' as mongoDart;

class Pedido {
  num id = -1;

  User user =
      User(id: mongoDart.ObjectId(), name: '', age: 0, phone: 0, email: '');
  Installer installer = Installer(-1, '', -1, -1, 0, 0);

  Plans plans = Plans(-1, '123', 123, 15, 15, 'Plano de internet muito bom',
      99.99, 'cable', LatLng(-22.2524903, -45.7034723));

  String status = 'aberto'; // aberto, aceito, recusado
  Icon statusIcon = Icon(Icons.launch, color: Colors.black54, size: 40.0);

  DateTime? dataAtendimento = DateTime.now();

  Pedido(this.id, this.user, this.installer, this.plans, this.status,
      this.dataAtendimento) {}

  Map<String, dynamic> toMap() {
    return {
      '_id': id,

      'user': user.toMap(),
      'plans': plans.toMap(),
      'status': status,
      'dataAtendimento': dataAtendimento.toString()
      // 'phone': phone,
    };
  }

  Future<List<Map<String, dynamic>>> getDocuments() async {
    var db = await mongoDart.Db.create(MONGO_CONN_URL);
    await db.open();
    var userCollection = db.collection('pedido');

    try {
      final pedidos = await userCollection.find().toList();
      return pedidos;
    } catch (e) {
      print(e);
      return Future.value(e as Future<List<Map<String, dynamic>>>);
    }
  }

  // Pedido.fromMap(Map<String, dynamic> map)
  //     : name = map['name'],
  //       email = map['email'],
  //       id = map['_id'],
  //       age = map['age'],
  //       phone = map['phone'];
}
