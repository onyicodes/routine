// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class Routine extends Equatable {
  final int id;
   String title;
   String description;
  final String routineTime;
  final String routineFrequency;
  bool routineExpired;
  bool completed;

   Routine(
      {required this.id,
      required this.title,
      required this.description,
      required this.routineTime,
      required this.routineFrequency,
      required this.routineExpired,
      required this.completed});

  @override
  List<Object?> get props => [id, title,routineExpired, routineFrequency, description, routineTime, completed];
}
