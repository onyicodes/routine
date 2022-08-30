import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:routine2/core/state_manager/routine_state_manage.dart';
import 'package:routine2/features/routine/domain/entity/routine_entity.dart';
import 'package:routine2/features/routine/presentation/bloc/mark_routine_completed_bloc/mark_routine_complete_bloc.dart';
import 'package:routine2/features/routine/presentation/widgets/routine_page_widgets/routine_bottom_sheet_details.dart';
import 'package:provider/provider.dart';

class RoutinListLoaded extends StatefulWidget {
  final List<Routine> routineList;
  const RoutinListLoaded({Key? key, required this.routineList})
      : super(key: key);

  @override
  State<RoutinListLoaded> createState() => _RoutinListLoadedState();
}

class _RoutinListLoadedState extends State<RoutinListLoaded> {
  bool? routineCompleted = false;
  @override
  Widget build(BuildContext context) {
    TextTheme primaryTextTheme = Theme.of(context).primaryTextTheme;
    return SingleChildScrollView(
      child: Consumer<RoutineStateManager>(
          builder: (context, routineStateManager, child) {
        return Column(
          children: [
           const SizedBox(
              height: 20,
            ),
            if (routineStateManager.getCurrentRoutine != null)
              Text(
                'Current Task',
                style: primaryTextTheme.headline2,
              ),
           const SizedBox(
              height: 20,
            ),
            if (routineStateManager.getCurrentRoutine != null)
              Card(
                color: Theme.of(context).cardColor,
                elevation: 2.0,
                child: Row(
                  children: [
                    if (!routineStateManager.getRoutineChecked)
                      BlocConsumer<MarkRoutineDoneBloc, MarkRoutineDoneState>(
                          listener: (context, state) {
                        if (state is MarkRoutineDoneLoaded) {
                          Future.delayed(const Duration(milliseconds: 500), () {});
                        }
                      }, builder: (context, state) {
                        return Checkbox(
                          checkColor: const Color(0xffdddddd),
                          fillColor: MaterialStateProperty.all(
                              Theme.of(context).primaryColor),
                          side: state is MarkRoutineDoneError
                              ? const BorderSide(color: Colors.red, width: 1.5)
                              : BorderSide(
                                  color: routineCompleted ?? false
                                      ? Theme.of(context).primaryColor
                                      : const Color(0xffdddddd),
                                  width: 1.5),
                          value: routineCompleted,
                          onChanged: (value) {
                            setState(() {
                              routineCompleted = value!;
                            });
                            FocusManager.instance.primaryFocus?.unfocus();
                            
                            if (value != null && value) {
                              routineStateManager.setCompletedRoutineID(
                                  routineStateManager.getCurrentRoutine!.id,
                                  completed: value);
                               BlocProvider.of<MarkRoutineDoneBloc>(context).add(
                                MarkRoutineDoneEvent(
                                    routineID: routineStateManager
                                        .getCurrentRoutine!.id,
                                        marked: value));
                            }
                          },
                        );
                      }),
                    Expanded(
                      child: ListTile(
                          title: Text(
                              routineStateManager.getCurrentRoutine!.title),
                          subtitle: Text(routineStateManager
                              .getCurrentRoutine!.routineTime
                              .toString()),
                          onTap: () {
                            buttomSheetDetail(
                                context: context,
                                routine: routineStateManager.getCurrentRoutine
                                    as Routine,
                                routineIndex: null);

                            ///index for current routine
                          }),
                    ),
                  ],
                ),
              ),
            if (routineStateManager.getCurrentRoutine == null)
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
                child: Text(
                  routineStateManager.getNextUpText,
                  softWrap: true,
                  style: primaryTextTheme.headline4,
                ),
              ),
           const  SizedBox(height: 20),
            Text(
              'Up Next',
              style: primaryTextTheme.headline2,
            ),
            const SizedBox(
              height: 20,
            ),
            ListView.builder(
                shrinkWrap: true,
                itemCount: routineStateManager.getActiveRoutineList.length,
                physics:const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  
                  return Card(
                    color: Theme.of(context).cardColor,
                    elevation: 2.0,
                    child: ListTile(
                        title: Text(routineStateManager
                            .getActiveRoutineList[index].title),
                        subtitle: Text(routineStateManager
                            .getActiveRoutineList[index].routineTime
                            .toString()),
                        onTap: () {
                          buttomSheetDetail(
                              context: context,
                              routine: routineStateManager
                                  .getActiveRoutineList[index],
                              routineIndex: index);
                        }),
                  );
                }),
          ],
        );
      }),
    );
    
  }
}
