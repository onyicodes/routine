// ignore_for_file: overridden_fields

import 'package:json_annotation/json_annotation.dart';
import 'package:routine2/features/routine/domain/entity/routine_entity.dart';

part 'routine_model.gofa.dart';

@JsonSerializable()
// ignore: must_be_immutable
class RoutineModel extends Routine {
  @override
  final int id;
  @override
  final String title;
  @override
  final String description;
  @override
  final String routineTime;
  @override
  final String routineFrequency;
  @override
  bool routineExpired;
   @override
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
