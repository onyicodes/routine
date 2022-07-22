import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:routine2/features/routine/data/model/routine_model.dart';
import 'package:routine2/features/routine/domain/entity/routine_entity.dart';

import '../../../../fixture/routine_fixture_reader.dart';

void main() {
  RoutineModel tRoutineModel = RoutineModel(
      id: 1,
      title: 'title',
      description: 'description',
      routineTime: '2022-07-22 09:07:07.092',
      routineFrequency: 'Hourly',
      routineExpired: false,
      completed: false);

  test('should be a subclass of Routine', () {
    expect(tRoutineModel, isA<Routine>());
  });

  group('fromJson', () {
    WidgetsFlutterBinding.ensureInitialized();
    test('should return a valid model', () async {
      final Map<String, dynamic> jsonMap =
          json.decode(await routineFixture('assets/json/routine_data.json'));
      final result = RoutineModel.fromJson(jsonMap);
      expect(result, tRoutineModel);
    });

    group('toJson', () {
      test('should return a JSON map containing the proper data', () async {
        final result = tRoutineModel.toJson();
        final expectedJsonMap = {
          "id": 1,
          "title": "First task",
          "description": "working on project D",
          "routineTime": "2022-07-22 11:05",
          "routineFrequency": "Hourly",
          "routineExpired": false,
          "completed": false
        };

        expect(result, expectedJsonMap);
      });
    });
  });
}
