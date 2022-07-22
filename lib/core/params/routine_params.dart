import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class RoutineParams extends Equatable {
  final String title;
  final String description;
  final String routineTime;
  final String routineFrequency;
  final bool routineExpired;
  final bool completed;

  const RoutineParams(
      {required this.title,
      required this.description,
      required this.routineTime,
      required this.routineExpired,
      required this.routineFrequency,
      required this.completed});

  @override
  List<Object?> get props => [title, description, routineTime, completed, routineExpired, routineFrequency];
}
