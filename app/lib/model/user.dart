import 'package:app/config/Constants.dart';
import 'package:mongo_dart/mongo_dart.dart';

class User {
  ObjectId id = ObjectId();
  String name = '';
  String email = '';
  num age = 0;
  num phone = -1;
  String endereco =
      'Av. João de Camargo, 510 - Centro, Santa Rita do Sapucaí - MG, 37540-000';

  User(
      {required this.id,
      required this.name,
      required this.age,
      required this.phone,
      required this.email});

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'name': name,
      'email': email,
      'age': age,
      'phone': phone,
    };
  }

  Future<List<Map<String, dynamic>>> getDocuments() async {
    var db = await Db.create(MONGO_CONN_URL);
    await db.open();
    var userCollection = db.collection('user');

    try {
      final users = await userCollection.find().toList();
      return users;
    } catch (e) {
      print(e);
      return Future.value(e as Future<List<Map<String, dynamic>>>);
    }
  }

  User.fromMap(Map<String, dynamic> map)
      : name = map['name'],
        email = map['email'],
        id = map['_id'],
        age = map['age'],
        phone = map['phone'];
}
