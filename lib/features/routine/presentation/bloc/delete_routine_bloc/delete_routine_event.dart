part of 'delete_routine_bloc.dart';

abstract class DeletingRoutineEvent extends Equatable {
  const DeletingRoutineEvent();

  @override
  List<Object> get props => [];
}

class DeleteRoutineEvent extends DeletingRoutineEvent {
  final int routineID;
  const DeleteRoutineEvent(
      {required this.routineID,});

  @override
  List<Object> get props => [routineID];
}
