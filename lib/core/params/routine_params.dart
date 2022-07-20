import 'package:equatable/equatable.dart';

class RoutineParams extends Equatable {
  final String title;
  final String description;
  final String routineTime;
  final bool completed;

  const RoutineParams(
      {required this.title, required this.description, required this.routineTime, required this.completed});

  @override
  List<Object?> get props => [title, description,
  routineTime, completed];
}
