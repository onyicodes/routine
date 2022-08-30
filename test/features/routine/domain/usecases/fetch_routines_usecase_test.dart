import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:routine2/core/usecase/usecase_builder.dart';
import 'package:routine2/features/routine/domain/entity/routine_entity.dart';
import 'package:routine2/features/routine/domain/repository/routine_repository_impl.dart';
import 'package:routine2/features/routine/domain/usecase/routine_usecases.dart';


import 'fetch_routines_usecase_test.mocks.dart';

@GenerateMocks([RoutineRepository])
void main() {
  late FetchRoutinesUsecase usecase;
  late MockRoutineRepository mockaRoutineRepository;

  setUp(() {
    mockaRoutineRepository = MockRoutineRepository();
    usecase = FetchRoutinesUsecase(mockaRoutineRepository);
  });

 
   List<Routine> tRoutine =  [Routine(id: 1, title: 'title', description: 'description', routineTime: '2022-07-22 09:07:07.092', routineFrequency: 'Hourly', routineExpired: false, completed: false)];

  test('should get routines from repository', () async {
    when(mockaRoutineRepository.fetchRoutines())
        .thenAnswer((realInvocation) async => Right(tRoutine));
    final result =
        await usecase( NoParams());
    expect(result,  Right(tRoutine));
    verify(mockaRoutineRepository.fetchRoutines());
    verifyNoMoreInteractions(mockaRoutineRepository);
  });
}
