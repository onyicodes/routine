part of 'update_routine_bloc.dart';

abstract class UpdatingRoutineEvent extends Equatable {
  const UpdatingRoutineEvent();

  @override
  List<Object> get props => [];
}

class UpdateRoutineEvent extends UpdatingRoutineEvent {
  final String title;
  final String description;
  final int routineID;
  final bool routineExpired;
  const UpdateRoutineEvent(
      {required this.title,
      required this.description,
      required this.routineID,
      required this.routineExpired
      });

  @override
  List<Object> get props => [
        title,
        description,
        routineID,
        routineExpired
      ];
}
