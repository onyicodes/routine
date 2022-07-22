part of 'fetch_routine_with_id_bloc.dart';

abstract class FetchRoutineWithIDState extends Equatable {
  const FetchRoutineWithIDState();

  @override
  List<Object> get props => [];
}

class FetchRoutineWithIDInitial extends FetchRoutineWithIDState {}

class FetchRoutineWithIDLoading extends FetchRoutineWithIDState {}

class FetchRoutineWithIDLoaded extends FetchRoutineWithIDState {
  final Routine routine;

  const FetchRoutineWithIDLoaded({
    required this.routine,
  });

  @override
  List<Object> get props => [
        routine,
      ];
}

class FetchRoutineWithIDError extends FetchRoutineWithIDState {
  final String errorMessage;

  const FetchRoutineWithIDError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
