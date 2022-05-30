// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:app/model/installer.dart';
import 'package:app/model/plans.dart';
import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/services.dart' show rootBundle;

void main() {
  test('Create installers class', () async {
    // "id": 1,
    // "name": "Forest Wilderman",
    // "rating": 5,
    // "price_per_km": 4,
    // "lat": -22.07313024696883,
    // "lng": -45.48590095909857

    Installer installers = Installer(
        1, "Forest Wilderman", 5, 4, -22.07313024696883, -45.48590095909857);

    assert(installers.id == 1);
  });

  test('InstallersParser', () async {
    InstallersParser installersParser = InstallersParser();

    await installersParser.readJson();

    print(installersParser.installers[0].toString());

    // assert(installersParser.installers.length == 36);
  });
}
