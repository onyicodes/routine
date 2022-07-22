
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:routine2/routine_app.dart';
import 'package:routine2/service_locator/routine_injector.dart' as di;
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  AwesomeNotifications().initialize(
      'resource://drawable/res_notification_app_icon',
      [
        NotificationChannel(
            channelKey: 'background_channel',
            channelName: 'Basic Notifications',
            defaultColor: const Color(0xff1F88C1),
            importance: NotificationImportance.High,
            channelShowBadge: true,
            channelDescription: 'basic channel'),
        NotificationChannel(
            channelKey: 'basic_channel',
            
            channelName: 'Basic Notifications',
            defaultColor: const Color(0xff1F88C1),
            importance: NotificationImportance.Max,
            channelShowBadge: true,
            channelDescription: 'basic channel'),
        NotificationChannel(
            channelKey: 'scheduled_channel',
            channelName: 'Scheduled Notifications',
            defaultColor: const Color(0xff1F88C1),
            locked: true,
            channelShowBadge: true,
            importance: NotificationImportance.Max,
            channelDescription: 'schedule channel'),
        NotificationChannel(
            channelKey: 'promo_channel',
            channelName: 'Promotion Notifications',
            defaultColor: const Color(0xff1F88C1),
            locked: true,
            channelShowBadge: true,
            importance: NotificationImportance.Max,
            channelDescription: 'promo channel'),
      ],
    );

  di.routineInjectInit();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  runApp(MyRoutineApp(
    prefs: prefs,
  ));
}

