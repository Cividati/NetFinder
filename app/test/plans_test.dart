// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:app/model/plans.dart';
import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/services.dart' show rootBundle;

void main() {
  test('Create plans class', () async {
    // "id": 1,
    // "isp": "Viasat",
    // "data_capacity": 20,
    // "download_speed": 10,
    // "upload_speed": 1.5,
    // "description": "Architecto reiciendis quia vel explicabo quam molestias et.",
    // "price_per_month": 199,
    // "type_of_internet": "sat"

    Plans plans = Plans(
        1,
        'Viasat',
        20,
        10,
        1.5,
        "Architecto reiciendis quia vel explicabo quam molestias et.",
        199,
        'sat');

    assert(plans.id == 1);
  });

  test('PlansParser', () async {
    PlansParser p = PlansParser();

    await p.readJson();

    assert(p.plans.length == 28);
  });
}
