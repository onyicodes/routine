import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class AppCache {
  static const kUser = 'user';
  static const userLoggedIn = 'loggedIn';
  static const appThemeState = 'appThemeState';
  static const loginTime = 'LoginTime';

  static const kOnboarding = 'onboarding';
  static const kNotificationCounter = 'notificationCounter';


  Future<void> invalidate() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(kUser);
    // await prefs.setBool(kOnboarding, false);
  }

  


 

  Future<void> cacheCourseReminder(
      {required String courseID, required bool reminderIsSet}) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setBool(courseID, reminderIsSet);
  }

  Future<void> cacheAppThemeState({required bool? isLightTheme}) async {
    final prefs = await SharedPreferences.getInstance();
    if (isLightTheme == null) {
      prefs.remove(appThemeState);
    } else {
      prefs.setBool(appThemeState, isLightTheme);
    }
  }

  Future<bool> getCachedClassReminder({required String courseID}) async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getBool(courseID) ?? false;
  }

  getCachedAppThemeState({required SharedPreferences prefs}) {
    return prefs.getBool(appThemeState);
  }

  Future<void> saveNotificationCount({required int count}) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setInt(kNotificationCounter, count);
  }

  Future<void> saveLastLoginTime(
      {required DateTime lastLoginTime, required String name}) async {
    final prefs = await SharedPreferences.getInstance();
    final loginTimeString = lastLoginTime.toString();

    await prefs.setString(loginTime + name, loginTimeString);
  }

  

  Future<int> getNotificationCount() async {
    final prefs = await SharedPreferences.getInstance();

    int? notificationCounts = prefs.getInt(
      kNotificationCounter,
    );
    return notificationCounts ?? 0;
  }



  Future<void> completeOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(kOnboarding, true);
  }

  Future<bool> isUserLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    final cachedUserString = prefs.getString(kUser);
    return (cachedUserString != null && cachedUserString != '');
  }

  

  Future<bool> didCompleteOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(kOnboarding) ?? false;
  }
}
