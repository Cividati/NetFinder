// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:app/model/plans.dart';
import 'package:app/model/user.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:mongo_dart/mongo_dart.dart' as mongoDart;

void main() {
  test('Create user class', () async {
    User user = User(
        name: 'Rubens Cividati',
        email: 'rubens.cividati@gmail.com',
        age: 23,
        id: mongoDart.ObjectId(),
        phone: 359990990);
  });

  test('user.getDocuments()', () async {
    User user = User(
        name: 'Rubens Cividati',
        email: 'rubens.cividati@gmail.com',
        age: 23,
        id: mongoDart.ObjectId(),
        phone: 359990990);

    var users = await user.getDocuments();
    print(users.length);
  });

  test('user.getDocuments()', () async {
    User user = User(
        name: 'Rubens Cividati',
        email: 'rubens.cividati@gmail.com',
        age: 23,
        id: mongoDart.ObjectId(),
        phone: 359990990);

    var users = await user.getDocuments();
    print(users.length);
  });
}
