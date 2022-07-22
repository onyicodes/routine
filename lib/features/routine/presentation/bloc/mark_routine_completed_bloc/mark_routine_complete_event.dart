part of 'mark_routine_complete_bloc.dart';

abstract class MarkingRoutineDoneEvent extends Equatable {
  const MarkingRoutineDoneEvent();

  @override
  List<Object> get props => [];
}

class MarkRoutineDoneEvent extends MarkingRoutineDoneEvent {
  final int routineID;
  final bool marked;
  const MarkRoutineDoneEvent({
    required this.routineID,
    required this.marked
  });

  @override
  List<Object> get props => [
        routineID,
      ];
}
