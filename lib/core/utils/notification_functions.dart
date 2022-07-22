import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:routine2/features/routine/domain/entity/routine_entity.dart';

Future<void> cancelNotificationByID({required int notificationID}) async {
  await AwesomeNotifications().cancelSchedule(notificationID);
}

int createUniqueId() {
  return DateTime.now().millisecondsSinceEpoch.remainder(100000);
}

hourlyScheduleCalender({required int hour, required int minute}) {
 
  return NotificationCalendar(
    hour: hour,
    minute: minute,
    second: 0,
    millisecond: 0,
    repeats: false,
  );
}

dailyScheduleCalender(
    {required int day, required int hour, required int minute}) {
  return NotificationCalendar(
    day: day,
    hour: hour,
    minute: minute,
    second: 0,
    millisecond: 0,
    repeats: false,
  );
}

weeklyScheduleCalender(
    {required int weekday,
    required int day,
    required int hour,
    required int minute}) {
  return NotificationCalendar(
    weekday: weekday,
    day: day,
    hour: hour,
    minute: minute,
    second: 0,
    millisecond: 0,
    repeats: false,
  );
}

monthlylyScheduleCalender(
    {required int month,
    required int weekday,
    required int day,
    required int hour,
    required int minute}) {
  return NotificationCalendar(
    month: month,
    weekday: weekday,
    day: day,
    hour: hour,
    minute: minute,
    second: 0,
    millisecond: 0,
    repeats: false,
  );
}

yearlylyScheduleCalender(
    {required int year,
    required int month,
    required int weekday,
    required int day,
    required int hour,
    required int minute}) {
  return NotificationCalendar(
    year: year,
    month: month,
    weekday: weekday,
    day: day,
    hour: hour,
    minute: minute,
    second: 0,
    millisecond: 0,
    repeats: false,
  );
}

NotificationCalendar notificationSchedulePlannar(
    {required String routineFrequency, required String time}) {
  DateTime date = DateTime.parse(time);
  date.subtract(Duration(minutes: 5));
  if (routineFrequency == 'Hourly') {
    return hourlyScheduleCalender(hour: date.hour, minute: date.minute);
  } else if (routineFrequency == 'Daily') {
    return dailyScheduleCalender(
        day: date.day, hour: date.hour, minute: date.minute);
  } else if (routineFrequency == 'Weekly') {
    return weeklyScheduleCalender(
        weekday: date.weekday,
        day: date.day,
        hour: date.hour,
        minute: date.minute);
  } else if (routineFrequency == 'Monthly') {
    return monthlylyScheduleCalender(
        month: date.month,
        weekday: date.weekday,
        day: date.day,
        hour: date.hour,
        minute: date.minute);
  } else {
    print('wetin dey happen');
    return yearlylyScheduleCalender(
        year: date.year,
        month: date.month,
        weekday: date.weekday,
        day: date.day,
        hour: date.hour,
        minute: date.minute);
  }
}

Future<void> scheduleAwesomeNotification(
    {required Routine routine, required String time}) async {
  print('testing time$time');
  int uniqueID = createUniqueId();

  await AwesomeNotifications().createNotification(
      content: NotificationContent(
          id: uniqueID,
          channelKey: 'scheduled_channel',
          title: routine.title,
          body: routine.description,
          notificationLayout: NotificationLayout.Default,
          displayOnBackground: true,
          displayOnForeground: true,
          payload: {
            'id': routine.id.toString(),
            'notificationID': uniqueID.toString(),
            'routineFrequency': routine.routineFrequency,
            'description': routine.description,
            'title': routine.title,
            'routineTime': routine.routineTime
          }),
      schedule: notificationSchedulePlannar(
          routineFrequency: routine.routineFrequency, time: time));
}
