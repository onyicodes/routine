import 'package:flutter/material.dart';
import 'package:routine2/features/routine/domain/entity/routine_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_cache.dart';

class RoutineStateManager extends ChangeNotifier {
  SharedPreferences prefs;
  RoutineStateManager({required this.prefs});

  List<Routine> _activeRoutineList = <Routine>[];
  List<int> _missedRoutineIDs = <int>[];
  List<int> _completedRoutineIDs = <int>[];
  Routine? _currentRoutine;
  String _nextUpText = '';
  bool _routineChecked = false;

  final _appCache = AppCache();

  List<Routine> get getActiveRoutineList => _activeRoutineList;
  List<int> get missedRoutineIDs => _missedRoutineIDs;
  List<int> get completedRoutineIDs => _missedRoutineIDs;
  Routine? get getCurrentRoutine => _currentRoutine;
  bool get getRoutineChecked => _routineChecked;
  String get getNextUpText => _nextUpText;

  set setActiveRoutineList(List<Routine> routineList) {
    _activeRoutineList = routineList;
    _activeRoutineList.sort((a, b) => a.routineTime.compareTo(b.routineTime));
   if(_activeRoutineList.isNotEmpty){
     DateTime firstRoutineTime =
        DateTime.parse(_activeRoutineList[0].routineTime);
    DateTime now = DateTime.now();
    Duration remainingTime = firstRoutineTime.difference(now);
    if (remainingTime.inHours != 0) {
      _nextUpText =
          'Your have ${remainingTime.inHours} hours more to the next routine check';
    } else {
      _nextUpText =
          'Your have ${remainingTime.inMinutes} minutes more to the next routine check';
    }
   }

    notifyListeners();
  }

  set addToActiveRoutineList(Routine routineList) {
    _activeRoutineList.add(routineList);
    _activeRoutineList.sort((a, b) => a.routineTime.compareTo(b.routineTime));
    if(_activeRoutineList.isNotEmpty){
     DateTime firstRoutineTime =
        DateTime.parse(_activeRoutineList[0].routineTime);
    DateTime now = DateTime.now();
    Duration remainingTime = firstRoutineTime.difference(now);
    if (remainingTime.inHours != 0) {
      _nextUpText =
          'Your have ${remainingTime.inHours} hours more to the next routine check';
    } else {
      _nextUpText =
          'Your have ${remainingTime.inMinutes} minutes more to the next routine check';
    }
   }
    notifyListeners();
  }

  updateRoutine(
      {required String title,
      required String description,
      required int? routineIndex}) {
    if (routineIndex == null && _currentRoutine != null) {
      _currentRoutine!.description = description;
      _currentRoutine!.title = title;
    } else if (routineIndex != null) {
      _activeRoutineList[routineIndex].description = description;
      _activeRoutineList[routineIndex].title = title;
    }
     DateTime firstRoutineTime =
        DateTime.parse(_activeRoutineList[0].routineTime);
    DateTime now = DateTime.now();
    Duration remainingTime = firstRoutineTime.difference(now);
    if (remainingTime.inHours != 0) {
      _nextUpText =
          'Your have ${remainingTime.inHours} hours more to the next routine check';
    } else {
      _nextUpText =
          'Your have ${remainingTime.inMinutes} minutes more to the next routine check';
    }
    notifyListeners();
  }

  set setMissedRoutineID(int routineID) {
    _missedRoutineIDs.add(routineID);
    notifyListeners();
  }

  set setCurrentRoutine(Routine? routine) {
    _currentRoutine = routine;
    if(_activeRoutineList.isNotEmpty){
     DateTime firstRoutineTime =
        DateTime.parse(_activeRoutineList[0].routineTime);
    DateTime now = DateTime.now();
    Duration remainingTime = firstRoutineTime.difference(now);
    if (remainingTime.inHours != 0) {
      _nextUpText =
          'Your have ${remainingTime.inHours} hours more to the next routine check';
    } else {
      _nextUpText =
          'Your have ${remainingTime.inMinutes} minutes more to the next routine check';
    }
   }
    notifyListeners();
  }

  markCompletedRoutineID(int index, int routineID) {
    _activeRoutineList[index].completed = true;
    _missedRoutineIDs.add(routineID);
    if(_activeRoutineList.isNotEmpty){
     DateTime firstRoutineTime =
        DateTime.parse(_activeRoutineList[0].routineTime);
    DateTime now = DateTime.now();
    Duration remainingTime = firstRoutineTime.difference(now);
    if (remainingTime.inHours != 0) {
      _nextUpText =
          'Your have ${remainingTime.inHours} hours more to the next routine check';
    } else {
      _nextUpText =
          'Your have ${remainingTime.inMinutes} minutes more to the next routine check';
    }
   }
    notifyListeners();
  }

  setCompletedRoutineID(int routineID, {required bool completed}) {
    if (completed) {
      _completedRoutineIDs.add(routineID);
    } else {
      _completedRoutineIDs.removeWhere((id) => id == routineID);
    }

    notifyListeners();
  }

  unsetCompleteRoutineID(int routineID, {required bool completed}) {
    _completedRoutineIDs.add(routineID);
    notifyListeners();
  }

  removeRoutine({required int routineID}) {
    _activeRoutineList.removeWhere((routine) => routine.id == routineID);
    notifyListeners();
  }

  Routine? getRoutineWithID(int routineID) {
    _routineChecked = true;
    for (Routine routine in _activeRoutineList) {
      if (routine.id == routineID) {
        return routine;
      }
    }

    notifyListeners();
  }
}
