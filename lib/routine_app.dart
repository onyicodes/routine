
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:routine2/core/state_manager/app_state_manager.dart';
import 'package:routine2/home.dart';
import 'package:routine2/routine_theme.dart';

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
  late final state;

  @override
  void initState() {

    prefs = widget.prefs;
    _appStateManager = AppStateManager(prefs: prefs);
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
         
        ],
        child: MultiBlocProvider(
          providers: [],
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
              home: HomePage(),
            );
          }),
        ),
      );
   
  }
}
