
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:provider/provider.dart';
import 'package:routine2/core/state_manager/app_state_manager.dart';
import 'package:routine2/core/state_manager/routine_state_manage.dart';
import 'package:routine2/features/routine/presentation/bloc/add_routine_bloc/add_routine_bloc.dart';
import 'package:routine2/features/routine/presentation/bloc/delete_routine_bloc/delete_routine_bloc.dart';
import 'package:routine2/features/routine/presentation/bloc/fetch_routine_with_id_bloc/fetch_routine_with_id_bloc.dart';
import 'package:routine2/features/routine/presentation/bloc/fetch_routines_bloc/fetch_routines_bloc.dart';
import 'package:routine2/features/routine/presentation/bloc/mark_routine_completed_bloc/mark_routine_complete_bloc.dart';
import 'package:routine2/features/routine/presentation/bloc/update_routine_bloc/update_routine_bloc.dart';

import 'package:routine2/routine_theme.dart';
import 'package:routine2/service_locator/routine_injector.dart';
import 'package:routine2/splash_page.dart';

import 'package:shared_preferences/shared_preferences.dart';

class MyRoutineApp extends StatefulWidget {
  final SharedPreferences prefs;
  const MyRoutineApp({Key? key, required this.prefs}) : super(key: key);

  @override
  _MyRoutineAppState createState() => _MyRoutineAppState();
}

class _MyRoutineAppState extends State<MyRoutineApp> {
  late SharedPreferences prefs;
  late final bool isLightThemeAppState;
  late ThemeData theme;
   late final AppStateManager _appStateManager;
    late final RoutineStateManager _routineStateManager;


  @override
  void initState() {

    prefs = widget.prefs;
    _appStateManager = AppStateManager(prefs: prefs);
     _routineStateManager = RoutineStateManager(prefs: prefs);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
         
          ChangeNotifierProvider(
            create: (context) => _appStateManager,
          ),
          ChangeNotifierProvider(
            create: (context) => _routineStateManager,
          ),
         
        ],
        child: MultiBlocProvider(
          providers: [
           BlocProvider(
              create: (_) => routineSl<FetchRoutinesBloc>(),
            ),
          BlocProvider(
              create: (_) => routineSl<FetchRoutineWithIDBloc>(),
            ),
          BlocProvider(
              create: (_) => routineSl<AddRoutineBloc>(),
            ),
          BlocProvider(
              create: (_) => routineSl<UpdateRoutineBloc>(),
            ),
          BlocProvider(
              create: (_) => routineSl<DeleteRoutineBloc>(),
            ),
          BlocProvider(
              create: (_) => routineSl<MarkRoutineDoneBloc>(),
            ),
          
          ],
          child: Consumer<AppStateManager>(
              builder: (context, appStateManager, child) {
            ThemeData theme;
            if (appStateManager.isLightTheme ?? true) {
              theme = RoutineAppTheme.light();
            } else {
              theme = RoutineAppTheme.dark();
            }
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: theme,
              themeMode: appStateManager.isLightTheme == null
                  ? ThemeMode.system
                  : appStateManager.isLightTheme!
                      ? ThemeMode.light
                      : ThemeMode.dark,
              darkTheme: RoutineAppTheme.dark(),
              title: 'Routine',
              home:const SplashScreen(),
               builder: (BuildContext context, Widget? child) {
                return Material(
                  type: MaterialType.transparency,
                  child: FlutterSmartDialog(
                    child: child,
                  ),
                );
              },
            );
          }),
        ),
      );
   
  }
}
