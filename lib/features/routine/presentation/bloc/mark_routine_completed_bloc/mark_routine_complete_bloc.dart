import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:routine2/core/error/handle_failure_response.dart';
import 'package:routine2/core/params/mark_routine_complete_params.dart';
import 'package:routine2/features/routine/domain/usecase/routine_usecases.dart';

part 'mark_routine_complete_event.dart';
part 'mark_routine_complete_state.dart';

class MarkRoutineDoneBloc
    extends Bloc<MarkingRoutineDoneEvent, MarkRoutineDoneState> {
  final MarkRoutineDoneUsecase markRoutineDoneUsecase;

  MarkRoutineDoneBloc({
    required this.markRoutineDoneUsecase,
  }) : super(MarkRoutineDoneInitial()) {
    on<MarkRoutineDoneEvent>(_addNewRoutineEvent);
  }

  void _addNewRoutineEvent(
      MarkRoutineDoneEvent event, Emitter<MarkRoutineDoneState> emit) async {
    emit(MarkRoutineDoneLoading());
    final response = await markRoutineDoneUsecase(MarkRoutineDoneParams(
       routineID : event.routineID, marked: event.marked));

    emit(response.fold(
        (failure) =>
            MarkRoutineDoneError(errorMessage: mapFailureResponse(failure)),
        (routineMarked) {
      return MarkRoutineDoneLoaded(
        routineMarked: routineMarked,
      );
    }));
  }
}
