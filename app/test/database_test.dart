import 'package:app/database/database.dart';
import 'package:app/model/user.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mongo_dart/mongo_dart.dart';

void main() {
  test('insert()', () async {
    await MongoDatabase.connect();

    // Criando usuário de exemplo
    User u = User(
        id: ObjectId(),
        name: 'Example',
        email: 'email@example.com',
        age: 99,
        phone: 999);
    await MongoDatabase.insert(u);
  });

  test('getDocuments()', () async {
    await MongoDatabase.connect();

    // lendo todos os users
    var users = await MongoDatabase.getDocuments();
    print(users);
  });

  test('update()', () async {
    await MongoDatabase.connect();

    // atualizando a idade de todos os usuários para 22
    var users = await MongoDatabase.getDocuments();
    for (var u in users) {
      User user = User.fromMap(u);
      user.age = 22;
      await MongoDatabase.update(user);
    }
  });

  test('delete()', () async {
    await MongoDatabase.connect();

    // Deletando o user com o nome de Example
    var users = await MongoDatabase.getDocuments();
    for (var u in users) {
      User user = User.fromMap(u);
      if (user.name == 'Example') await MongoDatabase.delete(user);
    }
  });
}
