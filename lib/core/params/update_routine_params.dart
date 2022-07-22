import 'package:equatable/equatable.dart';

class UpdateRoutineParams extends Equatable {
  final int routineID;
  final String title;
  final String description;
  final bool routineExpired;

  const UpdateRoutineParams(
      {required this.routineID,
      required this.title,
      required this.description,
      required this.routineExpired
      });

  @override
  List<Object?> get props => [
        routineID,
        title,
        description,
      ];
}
