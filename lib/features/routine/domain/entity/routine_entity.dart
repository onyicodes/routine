import 'package:equatable/equatable.dart';

class Routine extends Equatable {
  final int id;
  final String title;
  final String description;
  final String routineTime;
  final bool completed;

  const Routine(
      {required this.id,
      required this.title,
      required this.description,
      required this.routineTime,
      required this.completed});

  @override
  List<Object?> get props => [id, title, description, routineTime, completed];
}
