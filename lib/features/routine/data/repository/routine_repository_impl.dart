import 'package:dartz/dartz.dart';
import 'package:routine2/core/error/exceptions.dart';
import 'package:routine2/core/error/failure.dart';
import 'package:routine2/features/routine/data/datasource/routine_db_manager.dart';
import 'package:routine2/features/routine/domain/entity/routine_entity.dart';
import 'package:routine2/features/routine/domain/repository/routine_repository_impl.dart';

class RoutineRepositoryImpl extends RoutineRepository{
  final RoutineDbManager remoteDataSource;

  RoutineRepositoryImpl(
      {required this.remoteDataSource});
  @override
  Future<Either<Failure, Routine>> addRoutine({ required String title, required String description, required String routineTime, required bool completed, required String routineFrequency, required bool routineExpired }) async{
    try {
      final routine = await remoteDataSource.addRoutine(title: title, description: description, routineTime: routineTime, completed: completed, routineFrequency: routineFrequency, routineExpired: routineExpired);
      return Right(routine);
    } on DbException {
      return Left(DbFailure());
    }
  }
  @override
  Future<Either<Failure, bool>> deleteRoutine({required int routineId}) async{
     try {
      final routineDeleted = await remoteDataSource.deleteRoutine(routineId: routineId);
      return Right(routineDeleted);
    } on DbException {
      return Left(DbFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> markRoutineDone({required int routineId, required bool marked}) async{
     try {
      final routineMarkedDone = await remoteDataSource.markRoutineDone(routineId: routineId, marked: marked );
      return Right(routineMarkedDone);
    } on DbException {
      return Left(DbFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> updateRoutine({required int routineId, required String title, required String description, required bool routineExpired})async{
     try {
      final routineUpdated = await remoteDataSource.updateRoutine(routineId: routineId, title: title, description: description, routineExpired:routineExpired );
      return Right(routineUpdated);
    } on DbException {
      return Left(DbFailure());
    }
  }

  @override
  Future<Either<Failure, List<Routine>>> fetchRoutines()async{
     try {
      final routineList = await remoteDataSource.fetchRoutines();
      return Right(routineList);
    } on DbException {
      return Left(DbFailure());
    }
  }


  @override
  Future<Either<Failure, Routine>> fetchRoutineWithID({required int routineID})async{
     try {
      final routine = await remoteDataSource.fetchRoutineWithID(routineID: routineID);
      return Right(routine);
    } on DbException {
      return Left(DbFailure());
    }
  }
}
