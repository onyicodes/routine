import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:routine2/core/error/handle_failure_response.dart';
import 'package:routine2/core/usecase/usecase_builder.dart';
import 'package:routine2/features/routine/domain/entity/routine_entity.dart';
import 'package:routine2/features/routine/domain/usecase/routine_usecases.dart';

part 'fetch_routines_event.dart';
part 'fetch_routines_state.dart';

class FetchRoutinesBloc extends Bloc<FetchRoutinesEvent, FetchRoutinesState> {
  final FetchRoutinesUsecase fetchRoutinesUsecase;

  FetchRoutinesBloc({
    required this.fetchRoutinesUsecase,
  }) : super(FetchRoutinesInitial()) {
    on<FetchAllRoutinesEvent>(_fetchRoutinesEvent);
  }

  void _fetchRoutinesEvent(
      FetchAllRoutinesEvent event, Emitter<FetchRoutinesState> emit) async {
    emit(FetchRoutinesLoading());
    final response = await fetchRoutinesUsecase(NoParams());

    emit(response.fold(
        (failure) =>
            FetchRoutinesError(errorMessage: mapFailureResponse(failure)),
        (routineList) {
      return FetchRoutinesLoaded(
        routineList: routineList,
      );
    }));
  }
}
