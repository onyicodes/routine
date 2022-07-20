import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:routine2/core/error/handle_failure_response.dart';
import 'package:routine2/core/params/update_routine_params.dart';
import 'package:routine2/features/routine/domain/usecase/routine_usecases.dart';

part 'update_routine_event.dart';
part 'update_routine_state.dart';

class UpdateRoutineBloc extends Bloc<UpdatingRoutineEvent, UpdateRoutineState> {
  final UpdateRoutineUsecase updateRoutineUsecase;

  UpdateRoutineBloc({
    required this.updateRoutineUsecase,
  }) : super(UpdateRoutineInitial()) {
    on<UpdateRoutineEvent>(_updateRoutineEvent);
  }

  void _updateRoutineEvent(
      UpdateRoutineEvent event, Emitter<UpdateRoutineState> emit) async {
    emit(UpdateRoutineLoading());
    final response = await updateRoutineUsecase(UpdateRoutineParams(
        title: event.title,
        description: event.description,
        routineID: event.routineID));

    emit(response.fold(
        (failure) =>
            UpdateRoutineError(errorMessage: mapFailureResponse(failure)),
        (routineUpdated) {
      return UpdateRoutineLoaded(
        routineUpdated: routineUpdated,
      );
    }));
  }
}
