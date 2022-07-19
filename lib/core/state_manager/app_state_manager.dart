import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_cache.dart';

class OlevelgurusTab {
  static const String landing = 'landing';
  static const String order = 'orders';
}

class CoursePayDetails {
  int amountPaid;
  DateTime duration;

  CoursePayDetails(this.amountPaid, this.duration);
}

class AppStateManager extends ChangeNotifier {
  SharedPreferences prefs;
  AppStateManager({required this.prefs});

  bool _rememberMe = false;
  int _notificationBadgeCounter = 0;
  late bool _isLightTheme;


  String _selectedTab = OlevelgurusTab.landing;
  String _accountType = '';
  Map _registerData = {};
  Map _verificationData = {};
  int _userID = 1;
  late String _phone;
  late String _isInstant;
  final _appCache = AppCache();
  
  late String _shopUrl;

  int get getNotificationBadgeCounter => _notificationBadgeCounter;
  
  String get getAccountType => _accountType;
  int get getUserId => _userID;
  String get getPhoneNumber => _phone;
  String get getIsInstant => _isInstant;
  bool get getRemeberMe => _rememberMe;
  String get getSeletectedTab => _selectedTab;
  Map get getRegData => _registerData;
   Map get getVerificationData => _verificationData;
  //should return _user when login is working fine
  bool? get isLightTheme => _appCache.getCachedAppThemeState(prefs: prefs);


  String get getShopUrl => _shopUrl;

  void initializeNotificationCount() async {
    _notificationBadgeCounter = await _appCache.getNotificationCount();
    notifyListeners();
  }

  set setUserID(int userID) {
    _userID = userID;
    notifyListeners();
  }

  set setRegisterData(Map registerData) {
    _registerData = registerData;
    notifyListeners();
  }

  set setVerificationData(Map verificationData) {
    _verificationData = verificationData;
    notifyListeners();
  }

  

  void setAppThemeState({
    required bool? isLightTheme,
  }) async {
    _appCache.cacheAppThemeState(isLightTheme: isLightTheme);
    notifyListeners();
  }

  getAppThemeState() {
    _isLightTheme = _appCache.getCachedAppThemeState(prefs: prefs);

    return _isLightTheme;
  }

  void saveLoginTime({required String name}) {
    DateTime now = DateTime.now();
    _appCache.saveLastLoginTime(lastLoginTime: now, name: name);
  }

  

  void setNotificationBadgetCounter({
    required int count,
  }) async {
    _notificationBadgeCounter = count;
    await _appCache.saveNotificationCount(count: count);
    notifyListeners();
  }

 

  void setRemeberMe({required bool rememberMe}) {
    _rememberMe = rememberMe;
    notifyListeners();
  }

  set goToTab(index) {
    _selectedTab = index;
    notifyListeners();
  }

}
