part of 'fetch_routine_with_id_bloc.dart';

abstract class FetchRoutineWithIDEvent extends Equatable {
  const FetchRoutineWithIDEvent();

  @override
  List<Object> get props => [];
}

class FetchRoutineEvent extends FetchRoutineWithIDEvent {
  final int routineID;

  const FetchRoutineEvent({required this.routineID});

  @override
  List<Object> get props => [routineID];
}
