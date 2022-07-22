import 'package:get_it/get_it.dart';
import 'package:routine2/features/routine/data/datasource/routine_db_manager.dart';
import 'package:routine2/features/routine/data/repository/routine_repository_impl.dart';
import 'package:routine2/features/routine/domain/repository/routine_repository_impl.dart';
import 'package:routine2/features/routine/domain/usecase/routine_usecases.dart';
import 'package:routine2/features/routine/presentation/bloc/add_routine_bloc/add_routine_bloc.dart';
import 'package:routine2/features/routine/presentation/bloc/delete_routine_bloc/delete_routine_bloc.dart';
import 'package:routine2/features/routine/presentation/bloc/fetch_routine_with_id_bloc/fetch_routine_with_id_bloc.dart';
import 'package:routine2/features/routine/presentation/bloc/fetch_routines_bloc/fetch_routines_bloc.dart';
import 'package:routine2/features/routine/presentation/bloc/mark_routine_completed_bloc/mark_routine_complete_bloc.dart';
import 'package:routine2/features/routine/presentation/bloc/update_routine_bloc/update_routine_bloc.dart';

final routineSl = GetIt.instance;

Future<void> routineInjectInit() async {
  routineSl.registerFactory(() =>
      FetchRoutinesBloc(fetchRoutinesUsecase: routineSl()));

  routineSl.registerFactory(() =>
      FetchRoutineWithIDBloc(fetchRoutineWithIDUsecase: routineSl()));
      
   routineSl.registerFactory(() =>
      AddRoutineBloc(addRoutineUsecase: routineSl()));

     routineSl.registerFactory(() =>
      DeleteRoutineBloc(deleteRoutineUsecase: routineSl()));

   routineSl.registerFactory(() =>
      UpdateRoutineBloc(updateRoutineUsecase: routineSl()));

   routineSl.registerFactory(() =>
      MarkRoutineDoneBloc(markRoutineDoneUsecase: routineSl()));

   
  routineSl.registerLazySingleton(() => FetchRoutinesUsecase(routineSl()));

  routineSl.registerLazySingleton(() => FetchRoutineWithIDUsecase(routineSl()));

  routineSl.registerLazySingleton(() => AddRoutineUsecase(routineSl()));

  routineSl.registerLazySingleton(() => DeleteRoutineUsecase(routineSl()));

  routineSl.registerLazySingleton(() => UpdateRoutineUsecase(routineSl()));

  routineSl.registerLazySingleton(() => MarkRoutineDoneUsecase(routineSl()));


  routineSl.registerLazySingleton<RoutineRepository>(() => RoutineRepositoryImpl(
      remoteDataSource: routineSl(),));
  routineSl.registerLazySingleton<RoutineDbManager>(
      () => RoutineDbManagerImpl());
  //! External
   }
