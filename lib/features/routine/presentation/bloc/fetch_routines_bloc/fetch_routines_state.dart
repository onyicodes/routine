part of 'fetch_routines_bloc.dart';

abstract class FetchRoutinesState extends Equatable {
  const FetchRoutinesState();

  @override
  List<Object> get props => [];
}

class FetchRoutinesInitial extends FetchRoutinesState {}

class FetchRoutinesLoading extends FetchRoutinesState {}

class FetchRoutinesLoaded extends FetchRoutinesState {
  final List<Routine> routineList;

  const FetchRoutinesLoaded({
    required this.routineList,
  });

  @override
  List<Object> get props => [
        routineList,
      ];
}

class FetchRoutinesError extends FetchRoutinesState {
  final String errorMessage;

  const FetchRoutinesError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
