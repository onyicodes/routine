import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';

Future<TimeOfDay?> timePicker({required BuildContext context}) async {
  DateTimePicker(
  type: DateTimePickerType.dateTimeSeparate,
  dateMask: 'd MMM, yyyy',
  initialValue: DateTime.now().toString(),
  firstDate: DateTime(2000),
  lastDate: DateTime(2100),
  icon:const Icon(Icons.event),
  dateLabelText: 'Date',
  timeLabelText: "Hour",
  selectableDayPredicate: (date) {
    // Disable weekend days to select from the calendar
    if (date.weekday == 6 || date.weekday == 7) {
      return false;
    }

    return true;
  },
  validator: (val) {
    return null;
  },
);
  TimeOfDay? timeOfDay;
  DateTime now = DateTime.now();

  timeOfDay = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(
        now.add(
         const Duration(minutes: 1),
        ),
      ),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData(
            colorScheme:const ColorScheme.light(
              primary: Colors.teal,
            ),
          ),
          child: child!,
        );
      });

  return timeOfDay;
}