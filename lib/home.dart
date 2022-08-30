import 'dart:async';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:routine2/core/state_manager/routine_state_manage.dart';
import 'package:routine2/core/utils/notification_functions.dart';
import 'package:routine2/features/routine/domain/entity/routine_entity.dart';
import 'package:routine2/features/routine/presentation/bloc/add_routine_bloc/add_routine_bloc.dart';
import 'package:routine2/features/routine/presentation/pages/routine_page.dart';

import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
 const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late StreamSubscription<ReceivedAction> notificationsActionStreamSubscription;
  late StreamSubscription<ReceivedNotification>
      notificationsDisplayedStreamSubscription;
  @override
  void initState() {
    super.initState();
    notificationsDisplayedStreamSubscription =
        AwesomeNotifications().displayedStream.listen((event) {});
    notificationsActionStreamSubscription =
        AwesomeNotifications().actionStream.listen((notification) {});

    notificationsDisplayedStreamSubscription.onData((event) async {
      if (event.payload != null &&
          event.payload!['routineFrequency'] == 'Hourly') {
        ///notification fires 5mins earlier
        ///wait 5 mins to start the task
        await Future.delayed(const Duration(minutes: 5));
        Routine? routine =
            Provider.of<RoutineStateManager>(context, listen: false)
                .getRoutineWithID(int.parse(event.payload!['id'] as String));
        if (routine != null) {
          ///Move the routine from up next position to current task state position
          Provider.of<RoutineStateManager>(context, listen: false)
              .removeRoutine(routineID: routine.id);
          Provider.of<RoutineStateManager>(context, listen: false)
              .setCurrentRoutine = routine;

          /// Waits for five minutes to check if the user has marked the task and if not tag it as missed
          await Future.delayed(Duration(minutes: 5));

          DateTime routineTime =
              DateTime.parse(event.payload!['routineTime'] as String);

          DateTime newRoutineTime = getNewRoutineTime(
              frequency: routine.routineFrequency, time: routineTime);

          ///cancel current notification using the notificationID
          await cancelNotificationByID(
              notificationID:
                  int.parse(event.payload!['notificationID'] as String));

          /// create a new notification with updated time and date
          await scheduleAwesomeNotification(
              routine: routine, time: newRoutineTime.toString());
          Routine? currentRoutine =
              Provider.of<RoutineStateManager>(context, listen: false)
                  .getCurrentRoutine;
          Provider.of<RoutineStateManager>(context, listen: false)
              .setRoutineChecked = true;
          if (currentRoutine != null && currentRoutine.completed == false) {
            Provider.of<RoutineStateManager>(context, listen: false)
                .setMissedRoutineID = routine.id;
          }


          /// at the end of 15 timer the current routine expires
          final timer = Timer(
            const Duration(minutes: 5),
            () {
              Provider.of<RoutineStateManager>(context, listen: false)
                  .setCurrentRoutine = null;
              
          BlocProvider.of<AddRoutineBloc>(context).add(AddNewRoutineEvent(
              title: event.payload!['title'] as String,
              description: event.payload!['description'] as String,
              completed: false,
              routineTime: newRoutineTime.toString(),
              routineExpired: false,
              routineFrequency: event.payload!['routineFrequency'] as String));
            },
          );
        }
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddRoutineBloc, AddRoutineState>(
        listener: (context, state) {
      if (state is AddRoutineLoaded) {
        Provider.of<RoutineStateManager>(context, listen: false)
            .addToActiveRoutineList = state.returnedRoutine;
      }
    }, builder: (context, state) {
      return const RoutinePage();
    });
  }

  DateTime getNewRoutineTime(
      {required String frequency, required DateTime time}) {
    ///Sets new schedule with the given frequency
    switch (frequency) {
      case 'Hourly':
        return time.add(const Duration(hours: 1));
      case 'Daily':
        return time.add(const Duration(days: 1));
      case 'Weekly':
        return time.add(const Duration(days: 7));
      case 'Monthly':
        return DateTime(
            time.year, time.month + 1, time.day, time.hour, time.minute);
      case 'Yearly':
        return DateTime(
            time.year + 1, time.month, time.day, time.hour, time.minute);
      default:
        return time.add(const Duration(hours: 1));
    }
  }
}

class MessageNotification extends StatelessWidget {
  final VoidCallback onReply;

  final String prefixText;
  final String postContent;
  final String name;
  final String dpUrl;

  const MessageNotification(
      {Key? key,
      required this.onReply,
      required this.prefixText,
      required this.postContent,
      required this.name,
      required this.dpUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme primaryTextTheme = Theme.of(context).primaryTextTheme;
    return InkWell(
      onTap: onReply,
      child: Card(
        color: Theme.of(context).primaryColorDark,
        elevation: 4,
        margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        child: SafeArea(
          child: ListTile(
            contentPadding:const EdgeInsets.only(bottom: 12, left: 8, top: 8),
            leading: const SizedBox(
              width: 0.0,
            ),
            title: Text('$name $prefixText',
                style:
                    primaryTextTheme.headline4!.copyWith(color: Colors.white)),
            subtitle: Text(
              postContent,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: primaryTextTheme.bodyText1!.copyWith(color: Colors.white),
            ),
            trailing: prefixText == 'upvoted your answer' ||
                    prefixText == 'upvoted your question'
                ? IconButton(
                    onPressed: () {},
                    icon:const Icon(
                      Icons.thumb_up_outlined,
                      color: Colors.white,
                    ))
                : prefixText == 'downvoted your answer' ||
                        prefixText == 'downvoted your question'
                    ? IconButton(
                        onPressed: () {},
                        icon:const  Icon(
                          Icons.thumb_down_outlined,
                          color: Colors.white,
                        ))
                    : prefixText == "commented on your answer" ||
                            prefixText == "commented on your question"
                        ? IconButton(
                            onPressed: () {},
                            icon:const  Icon(
                              Icons.comment,
                              color: Colors.white,
                            ))
                        :const SizedBox(
                            width: 20,
                          ),
          ),
        ),
      ),
    );
  }
}
