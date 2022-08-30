
import 'package:dartz/dartz.dart';
import 'package:routine2/core/error/failure.dart';
import 'package:routine2/features/routine/domain/entity/routine_entity.dart';

abstract class RoutineRepository {
  Future<Either<Failure, Routine>> addRoutine({ required String title, required String description, required String routineTime, required bool completed, required bool routineExpired, required String routineFrequency });
  Future<Either<Failure, bool>> deleteRoutine({required int routineId});
  Future<Either<Failure, bool>> markRoutineDone({required int routineId, required bool marked});
  Future<Either<Failure, bool>> updateRoutine({required int routineId, required String title, required String description, required bool routineExpired});
  Future<Either<Failure, List<Routine>>> fetchRoutines();
  Future<Either<Failure, Routine>> fetchRoutineWithID({required int routineID});
}
