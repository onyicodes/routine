import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:routine2/features/routine/domain/entity/routine_entity.dart';

part 'routine_model.gofa.dart';

@JsonSerializable()
class RoutineModel extends Routine {
  final int id;
  final String title;
  final String description;
  final String routineTime;
  final String routineFrequency;
  bool routineExpired;
   bool completed;

  RoutineModel(
      {required this.id,
      required this.title,
      required this.description,
      required this.routineTime,
      required this.routineFrequency,
      required this.routineExpired,
      required this.completed})
      : super(
            id: id,
            title: title,
            description: description,
            routineExpired: routineExpired,
            routineFrequency: routineFrequency,
            routineTime: routineTime,
            completed: completed);

  factory RoutineModel.fromJson(Map<String, dynamic> json) =>
      _$RoutineModelFromJson(json);

  Map<String, dynamic> toJson() => _$RoutineModelToJson(this);
}
