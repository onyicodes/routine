part of 'update_routine_bloc.dart';

abstract class UpdateRoutineState extends Equatable {
  const UpdateRoutineState();

  @override
  List<Object> get props => [];
}

class UpdateRoutineInitial extends UpdateRoutineState {}

class UpdateRoutineLoading extends UpdateRoutineState {}

class UpdateRoutineLoaded extends UpdateRoutineState {
  final bool routineUpdated;

  const UpdateRoutineLoaded({
    required this.routineUpdated,
  });

  @override
  List<Object> get props => [
        routineUpdated,
      ];
}

class UpdateRoutineError extends UpdateRoutineState {
  final String errorMessage;

  const UpdateRoutineError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
