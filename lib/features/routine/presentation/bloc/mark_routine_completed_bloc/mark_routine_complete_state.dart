part of 'mark_routine_complete_bloc.dart';

abstract class MarkRoutineDoneState extends Equatable {
  const MarkRoutineDoneState();

  @override
  List<Object> get props => [];
}

class MarkRoutineDoneInitial extends MarkRoutineDoneState {}

class MarkRoutineDoneLoading extends MarkRoutineDoneState {}

class MarkRoutineDoneLoaded extends MarkRoutineDoneState {
  final bool routineMarked;

  const MarkRoutineDoneLoaded({
    required this.routineMarked,
  });

  @override
  List<Object> get props => [
        routineMarked,
      ];
}

class MarkRoutineDoneError extends MarkRoutineDoneState {
  final String errorMessage;

  const MarkRoutineDoneError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
