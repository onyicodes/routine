import 'package:dartz/dartz.dart';
import 'package:routine2/core/error/failure.dart';
import 'package:routine2/core/params/delete_routine_params.dart';
import 'package:routine2/core/params/fetch_routine_param.dart';
import 'package:routine2/core/params/mark_routine_complete_params.dart';
import 'package:routine2/core/params/routine_params.dart';
import 'package:routine2/core/params/update_routine_params.dart';
import 'package:routine2/core/usecase/usecase_builder.dart';
import 'package:routine2/features/routine/domain/entity/routine_entity.dart';
import 'package:routine2/features/routine/domain/repository/routine_repository_impl.dart';

class FetchRoutinesUsecase extends UseCase<List<Routine>, NoParams> {
  final RoutineRepository repository;

  FetchRoutinesUsecase(this.repository);

  @override
  Future<Either<Failure, List<Routine>>> call(NoParams params) async {
    return await repository.fetchRoutines();
  }
}

class FetchRoutineWithIDUsecase
    extends UseCase<Routine, FetchRoutineWithIDParams> {
  final RoutineRepository repository;

  FetchRoutineWithIDUsecase(this.repository);

  @override
  Future<Either<Failure, Routine>> call(FetchRoutineWithIDParams params) async {
    return await repository.fetchRoutineWithID(routineID: params.routineID);
  }
}

class AddRoutineUsecase extends UseCase<Routine, RoutineParams> {
  final RoutineRepository repository;

  AddRoutineUsecase(this.repository);

  @override
  Future<Either<Failure, Routine>> call(RoutineParams params) async {
    return await repository.addRoutine(
        title: params.title,
        description: params.description,
        routineTime: params.routineTime,
        completed: params.completed,
        routineFrequency: params.routineFrequency,
        routineExpired: params.routineExpired);
  }
}

class UpdateRoutineUsecase extends UseCase<bool, UpdateRoutineParams> {
  final RoutineRepository repository;

  UpdateRoutineUsecase(this.repository);

  @override
  Future<Either<Failure, bool>> call(UpdateRoutineParams params) async {
    return await repository.updateRoutine(
        routineId: params.routineID,
        title: params.title,
        description: params.description,
        routineExpired: params.routineExpired);
  }
}

class DeleteRoutineUsecase extends UseCase<bool, DeleteRoutineParams> {
  final RoutineRepository repository;

  DeleteRoutineUsecase(this.repository);

  @override
  Future<Either<Failure, bool>> call(DeleteRoutineParams params) async {
    return await repository.deleteRoutine(routineId: params.routineID);
  }
}

class MarkRoutineDoneUsecase extends UseCase<bool, MarkRoutineDoneParams> {
  final RoutineRepository repository;

  MarkRoutineDoneUsecase(this.repository);

  @override
  Future<Either<Failure, bool>> call(MarkRoutineDoneParams params) async {
    return await repository.markRoutineDone(routineId: params.routineID, marked: params.marked);
  }
}
