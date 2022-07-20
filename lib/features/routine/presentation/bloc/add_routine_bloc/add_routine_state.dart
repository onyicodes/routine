part of 'add_routine_bloc.dart';

abstract class AddRoutineState extends Equatable {
  const AddRoutineState();

  @override
  List<Object> get props => [];
}

class AddRoutineInitial extends AddRoutineState {}

class AddRoutineLoading extends AddRoutineState {}

class AddRoutineLoaded extends AddRoutineState {
  final Routine returnedRoutine;

  const AddRoutineLoaded({
    required this.returnedRoutine,
  });

  @override
  List<Object> get props => [
        returnedRoutine,
      ];
}

class AddRoutineError extends AddRoutineState {
  final String errorMessage;

  const AddRoutineError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
