import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:routine2/core/error/handle_failure_response.dart';
import 'package:routine2/core/params/fetch_routine_param.dart';
import 'package:routine2/features/routine/domain/entity/routine_entity.dart';
import 'package:routine2/features/routine/domain/usecase/routine_usecases.dart';

part 'fetch_routine_with_id_event.dart';
part 'fetch_routine_with_id_state.dart';

class FetchRoutineWithIDBloc
    extends Bloc<FetchRoutineWithIDEvent, FetchRoutineWithIDState> {
  final FetchRoutineWithIDUsecase fetchRoutineWithIDUsecase;

  FetchRoutineWithIDBloc({
    required this.fetchRoutineWithIDUsecase,
  }) : super(FetchRoutineWithIDInitial()) {
    on<FetchRoutineEvent>(_fetchRoutineWithIDEvent);
  }

  void _fetchRoutineWithIDEvent(
      FetchRoutineEvent event, Emitter<FetchRoutineWithIDState> emit) async {
    emit(FetchRoutineWithIDLoading());
    final response = await fetchRoutineWithIDUsecase(
        FetchRoutineWithIDParams(routineID: event.routineID));

    emit(response.fold(
        (failure) =>
            FetchRoutineWithIDError(errorMessage: mapFailureResponse(failure)),
        (routine) {
      return FetchRoutineWithIDLoaded(
        routine: routine,
      );
    }));
  }
}
