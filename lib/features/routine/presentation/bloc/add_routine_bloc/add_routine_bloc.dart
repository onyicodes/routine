import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:routine2/core/error/handle_failure_response.dart';
import 'package:routine2/core/params/routine_params.dart';
import 'package:routine2/features/routine/domain/entity/routine_entity.dart';
import 'package:routine2/features/routine/domain/usecase/routine_usecases.dart';

part 'add_routine_event.dart';
part 'add_routine_state.dart';

class AddRoutineBloc extends Bloc<AddRoutineEvent, AddRoutineState> {
  final AddRoutineUsecase addRoutineUsecase;

  AddRoutineBloc({
    required this.addRoutineUsecase,
  }) : super(AddRoutineInitial()) {
    on<AddNewRoutineEvent>(_addNewRoutineEvent);
  }

  void _addNewRoutineEvent(
      AddNewRoutineEvent event, Emitter<AddRoutineState> emit) async {
    emit(AddRoutineLoading());
    final response = await addRoutineUsecase(RoutineParams(
        title: event.title,
        description: event.description,
        completed: event.completed,
        routineTime: event.routineTime));

    emit(response.fold(
        (failure) =>
            AddRoutineError(errorMessage:mapFailureResponse(failure)),
        (addedRoutine) {
      return AddRoutineLoaded(
        returnedRoutine: addedRoutine,
      );
    }));
  }
}
