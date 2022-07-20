
import 'package:dartz/dartz.dart';
import 'package:routine2/core/error/failure.dart';
import 'package:routine2/features/routine/domain/entity/routine_entity.dart';

abstract class RoutineRepository {
  Future<Either<Failure, Routine>> addRoutine({ required String title, required String description, required String routineTime, required bool completed });
  Future<Either<Failure, bool>> deleteRoutine({required int routineId});
  Future<Either<Failure, bool>> markRoutineDone({required int routineId});
  Future<Either<Failure, bool>> updateRoutine({required int routineId, required String title, required String description});
  Future<Either<Failure, List<Routine>>> fetchRoutines();
}
