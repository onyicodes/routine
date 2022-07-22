import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:routine2/core/error/exceptions.dart';
import 'package:routine2/core/error/failure.dart';
import 'package:routine2/features/routine/data/datasource/routine_db_manager.dart';
import 'package:routine2/features/routine/data/repository/routine_repository_impl.dart';
import 'package:routine2/features/routine/domain/entity/routine_entity.dart';

import 'fetch_routines_repository_impl_test.mocks.dart';

@GenerateMocks([RoutineDbManager])
void main() {
  late RoutineRepositoryImpl repository;
  late MockRoutineDbManager mockRoutineDbManager;

  setUp(() {
    mockRoutineDbManager = MockRoutineDbManager();
    repository = RoutineRepositoryImpl(
        remoteDataSource: mockRoutineDbManager,);
  });

  group('sign in user and get user data', () {
    
   List<Routine> tRoutine =  [Routine(id: 1, title: 'title', description: 'description', routineTime: '2022-07-22 09:07:07.092', routineFrequency: 'Hourly', routineExpired: false, completed: false)];

    group('Fetch routines', () {
      

      test('should return routines from database', () async {
        when(mockRoutineDbManager.fetchRoutines())
            .thenAnswer((_) async => tRoutine);

        final result =
            await repository.fetchRoutines();
        verify(mockRoutineDbManager.fetchRoutines());
        expect(result, equals( Right(tRoutine)));
      });

      test(
          'should return db failure when the call to api server is unsuccessful',
          () async {
        when(mockRoutineDbManager.fetchRoutines())
            .thenThrow(DbException());
        final result = await repository.fetchRoutines();
        verify(mockRoutineDbManager.fetchRoutines());
        expect(result, equals(Left(DbFailure())));
      });
    });
  });
}
