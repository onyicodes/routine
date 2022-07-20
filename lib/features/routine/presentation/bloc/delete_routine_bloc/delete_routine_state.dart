part of 'delete_routine_bloc.dart';

abstract class DeleteRoutineState extends Equatable {
  const DeleteRoutineState();

  @override
  List<Object> get props => [];
}

class DeleteRoutineInitial extends DeleteRoutineState {}

class DeleteRoutineLoading extends DeleteRoutineState {}

class DeleteRoutineLoaded extends DeleteRoutineState {
  final bool routineDeleted;

  const DeleteRoutineLoaded({
    required this.routineDeleted,
  });

  @override
  List<Object> get props => [
        routineDeleted,
      ];
}

class DeleteRoutineError extends DeleteRoutineState {
  final String errorMessage;

  const DeleteRoutineError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
