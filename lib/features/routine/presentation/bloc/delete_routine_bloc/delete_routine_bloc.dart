import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:routine2/core/error/handle_failure_response.dart';
import 'package:routine2/core/params/delete_routine_params.dart';
import 'package:routine2/features/routine/domain/usecase/routine_usecases.dart';

part 'delete_routine_event.dart';
part 'delete_routine_state.dart';

class DeleteRoutineBloc extends Bloc<DeletingRoutineEvent, DeleteRoutineState> {
  final DeleteRoutineUsecase deleteRoutineUsecase;

  DeleteRoutineBloc({
    required this.deleteRoutineUsecase,
  }) : super(DeleteRoutineInitial()) {
    on<DeleteRoutineEvent>(_deleteRoutineEvent);
  }

  void _deleteRoutineEvent(
      DeleteRoutineEvent event, Emitter<DeleteRoutineState> emit) async {
    emit(DeleteRoutineLoading());
    final response = await deleteRoutineUsecase(DeleteRoutineParams(
      routineID: event.routineID,
    ));

    emit(response.fold(
        (failure) =>
            DeleteRoutineError(errorMessage: mapFailureResponse(failure)),
        (routineDeleted) {
      return DeleteRoutineLoaded(
        routineDeleted: routineDeleted,
      );
    }));
  }
}
