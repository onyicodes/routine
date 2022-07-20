import 'package:json_annotation/json_annotation.dart';
import 'package:routine2/features/routine/domain/entity/routine_entity.dart';

part 'routine_model.g.dart';

@JsonSerializable()
class RoutineModel extends Routine {
  final int id;
  final String title;
  final String description;
  final String routineTime;
  final bool completed;

  const RoutineModel(
      {required this.id,
      required this.title,
      required this.description,
      required this.routineTime,
      required this.completed})
      : super(
            id: id,
            title: title,
            description: description,
            routineTime: routineTime,
            completed: completed);

  factory RoutineModel.fromJson(Map<String, dynamic> json) =>
      _$RoutineModelFromJson(json);

  Map<String, dynamic> toJson() => _$RoutineModelToJson(this);
}
