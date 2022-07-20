import 'package:flutter/material.dart';
import 'package:routine2/routine_app.dart';
import 'package:routine2/service_locator/routine_injector.dart' as di;
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  di.routineInjectInit();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  runApp(MyRoutineApp(
    prefs: prefs,
  ));
}
