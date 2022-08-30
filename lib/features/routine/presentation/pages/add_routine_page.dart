import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'package:routine2/core/general_widgets/custom_app_bar.dart';
import 'package:routine2/core/state_manager/routine_state_manage.dart';
import 'package:routine2/core/toasts/toast_loading.dart';
import 'package:routine2/core/toasts/toast_message.dart';
import 'package:routine2/core/utils/notification_functions.dart';
import 'package:routine2/features/routine/domain/entity/routine_entity.dart';
import 'package:routine2/features/routine/presentation/bloc/add_routine_bloc/add_routine_bloc.dart';
import 'package:routine2/features/routine/presentation/bloc/update_routine_bloc/update_routine_bloc.dart';

class CreateRoutine extends StatefulWidget {
  const CreateRoutine({Key? key, this.routine, this.index}) : super(key: key);
  final Routine? routine;
  final int? index;

  @override
  _CreateRoutineState createState() => _CreateRoutineState();
}

class _CreateRoutineState extends State<CreateRoutine> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  List<String> weekdays = [
    'Hourly',
    'Daily',
    'Weekly',
    'Monthly',
    'Yearly',
  ];
  bool? titleEntered;
  bool? timeEntered;
  bool? descriptionEntered;
  bool? frequencyEntered;
  Routine? routine;
  bool invalidTimeEntered = false;
  int? index;

  String selectedTime = '';
  String selectedFrequency = '';

  @override
  void initState() {
    super.initState();
    routine = widget.routine;
    index = widget.index;
    if (routine != null) {
      titleController = TextEditingController(text: routine!.title);
      descriptionController = TextEditingController(text: routine!.description);
      selectedTime = routine!.routineTime;
    }
  }

  @override
  Widget build(BuildContext context) {
    TextTheme primaryTextTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: customAppBar(
            title: routine != null ? 'Edit Routine' : 'Add Routine',
            action: [
              TextButton(
                onPressed: () {
                  bool validated = validator();
                  if (validated) {
                    toastLoading(isLoading: true, loadingMessage: '');

                    if (routine != null) {
                      BlocProvider.of<UpdateRoutineBloc>(context)
                          .add(UpdateRoutineEvent(
                        routineID: routine!.id,
                        routineExpired: routine!.routineExpired,
                        title: titleController.text,
                        description: descriptionController.text,
                      ));
                    } else {
                      BlocProvider.of<AddRoutineBloc>(context).add(
                          AddNewRoutineEvent(
                              title: titleController.text,
                              description: descriptionController.text,
                              completed: false,
                              routineTime: selectedTime,
                              routineExpired: false,
                              routineFrequency: selectedFrequency));
                    }
                  }
                },
                style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all(const Size(50, 20)),
                  backgroundColor: MaterialStateProperty.all(
                    Theme.of(context).primaryColor,
                  ),
                ),
                child: Text(
                  'save',
                  style:
                      primaryTextTheme.bodyText1!.copyWith(color: Colors.white),
                ),
              ),
            ],
            context: context,
            primaryTextTheme: primaryTextTheme),
        body: BlocConsumer<AddRoutineBloc, AddRoutineState>(
            listener: (context, state) {
          if (state is AddRoutineLoaded) {
            scheduleAwesomeNotification(
                routine: state.returnedRoutine,
                time: state.returnedRoutine.routineTime);

            Future.delayed(const Duration(milliseconds: 500), () {
              toastLoading(isLoading: false, loadingMessage: '');
              Navigator.of(context).pop();
            });
          }
        }, builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.only(top: 35.0, left: 10.0, right: 10.0),
            child: ListView(children: <Widget>[
              BlocListener<UpdateRoutineBloc, UpdateRoutineState>(
                listener: ((context, state) {
                  if (state is UpdateRoutineLoaded) {
                    Provider.of<RoutineStateManager>(context, listen: false)
                        .updateRoutine(
                            title: titleController.text,
                            description: descriptionController.text,
                            routineIndex: index);
                    Future.delayed(const Duration(milliseconds: 500), () {
                      // toastLoading(isLoading: false, loadingMessage: '');
                      Navigator.of(context).pop();
                    });
                  }

                  if (state is UpdateRoutineError) {
                    toastMessage(message: state.errorMessage);
                  }
                }),
                child: Container(),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextField(
                    controller: titleController,
                    style: primaryTextTheme.bodyText1,
                    onChanged: (value) {
                      if (titleEntered != null && !titleEntered!) {
                        setState(() {
                          titleEntered = true;
                        });
                      }
                    },
                    decoration: InputDecoration(
                        labelText: 'Title',
                        labelStyle: primaryTextTheme.bodyText1,
                        errorText: titleEntered == null ||
                                titleEntered != null && titleEntered!
                            ? null
                            : 'Please enter routine title',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                    child: TextField(
                      controller: descriptionController,
                      style: primaryTextTheme.bodyText1,
                      onChanged: (value) {
                        if (descriptionEntered != null &&
                            !descriptionEntered!) {
                          setState(() {
                            descriptionEntered = true;
                          });
                        }
                      },
                      decoration: InputDecoration(
                          labelText: 'Description',
                          labelStyle: primaryTextTheme.bodyText1,
                          errorText: descriptionEntered == null ||
                                  descriptionEntered != null &&
                                      descriptionEntered!
                              ? null
                              : 'Please enter routine description',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                    ),
                  ),
                  if (routine == null)
                    Text(
                      'Routine time :',
                      style: primaryTextTheme.headline6,
                    ),
                  if (routine == null)
                    DateTimePicker(
                      type: DateTimePickerType.dateTime,
                      dateMask: 'd MMM, yyyy hh:mm aa',
                      initialValue: selectedTime,
                      initialTime: TimeOfDay.fromDateTime(
                          DateTime.now().add(const Duration(hours: 1))),
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2100),
                      icon: const Icon(Icons.event),
                      dateLabelText: 'Date and Time',
                      selectableDayPredicate: (date) {
                        // Disable weekend days to select from the calendar
                        // final dateDifference = date.difference(
                        //     DateTime.now().subtract(Duration(days: 1)));
                        // if (dateDifference.inDays > 1) {
                        //   return true;
                        // } else {
                        //   return false;
                        // }

                        return true;
                      },
                      onChanged: (val) {
                        setState(() {
                          selectedTime = val;
                          timeEntered = true;
                          invalidTimeEntered = false;
                        });
                      },
                      validator: (val) {
                        return null;
                      },
                      onSaved: (val) {
                        setState(() {
                          timeEntered = true;
                          invalidTimeEntered = false;
                        });
                      },
                    ),
                  const SizedBox(
                    height: 4,
                  ),
                  !invalidTimeEntered &&
                          (timeEntered == null ||
                              timeEntered != null && timeEntered!)
                      ? Container()
                      : Text(
                          invalidTimeEntered
                              ? 'Time entered is not valid'
                              : 'Please enter routine time',
                          style: primaryTextTheme.bodySmall!
                              .copyWith(color: Colors.red),
                        ),
                  const SizedBox(
                    height: 10,
                  ),
                  if (routine == null)
                    Text('Routine frequency',
                        style: primaryTextTheme.headline6),
                  const SizedBox(
                    height: 4,
                  ),
                  frequencyEntered == null ||
                          frequencyEntered != null && frequencyEntered!
                      ? Container()
                      : Text(
                          'Please enter routine frequency',
                          style: primaryTextTheme.bodySmall!
                              .copyWith(color: Colors.red),
                        ),
                  if (routine == null)
                    Wrap(
                      alignment: WrapAlignment.start,
                      spacing: 3,
                      children: [
                        for (String day in weekdays)
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                selectedFrequency = day;
                                if (frequencyEntered != null &&
                                    !frequencyEntered!) {
                                  frequencyEntered = true;
                                }
                              });
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                selectedFrequency == day
                                    ? Colors.deepOrange
                                    : Colors.teal,
                              ),
                            ),
                            child: Text(day),
                          ),
                      ],
                    ),
                ],
              ),
            ]),
          );
        }),
      ),
    );
  }

  bool validator() {
    bool validated = true;
    if (titleController.text.isEmpty) {
      setState(() {
        titleEntered = false;
        validated = false;
      });
    }
    if (descriptionController.text.isEmpty) {
      setState(() {
        descriptionEntered = false;
        validated = false;
      });
    }
    if (routine == null) {
      if (selectedFrequency.isEmpty) {
        setState(() {
          frequencyEntered = false;
          validated = false;
        });
      }
      if (selectedTime.isEmpty) {
        setState(() {
          timeEntered = false;
          validated = false;
        });
      } else if (DateTime.now().isAfter(DateTime.parse(selectedTime))) {
        setState(() {
          invalidTimeEntered = true;
          validated = false;
        });
      }
    }
    return validated;
  }
}
