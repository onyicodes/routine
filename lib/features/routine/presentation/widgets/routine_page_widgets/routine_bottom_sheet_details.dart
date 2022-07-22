import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:provider/provider.dart';
import 'package:routine2/features/routine/domain/entity/routine_entity.dart';
import 'package:routine2/features/routine/presentation/pages/add_routine_page.dart';

buttomSheetDetail({
  required BuildContext context,
  required Routine routine,
  required int? routineIndex,
}) {
  return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      builder: (context) {
        return RoutineBottomSheetDetail(
            routine: routine, routineIndex: routineIndex);
      });
}

class RoutineBottomSheetDetail extends StatefulWidget {
  ///Shows buttom sheet with routine details and an edit button
  ///routine index is null if the task is the current routine 
  final Routine routine;
  final int? routineIndex;

  const RoutineBottomSheetDetail(
      {Key? key, required this.routine, required this.routineIndex})
      : super(key: key);

  @override
  _RoutineBottomSheetDetailState createState() =>
      _RoutineBottomSheetDetailState();
}

class _RoutineBottomSheetDetailState extends State<RoutineBottomSheetDetail> {
  late Routine routine;
  int? index;

  TextEditingController _commentController = TextEditingController();
  FocusNode commentFocus = FocusNode();
  bool newCommentLoading = false;

  bool addComment = false;
  @override
  void initState() {
    super.initState();
    routine = widget.routine;
    index = widget.routineIndex;
  }

  @override
  Widget build(BuildContext context) {
    TextTheme primaryTextTheme = Theme.of(context).primaryTextTheme;
    return GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: SizedBox(
            height: 350,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Routine Task',
                        style: primaryTextTheme.headline3,
                      ),
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => CreateRoutine(
                                          routine: routine,
                                          index: index,
                                        )));
                              },
                              icon: Icon(Icons.edit,
                                  color: Theme.of(context).iconTheme.color))
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    routine.title,
                    style: primaryTextTheme.headline4,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(routine.description),
                  SizedBox(
                    height: 10,
                  ),
                  Wrap(spacing: 10, children: [
                    Chip(label: Text(routine.routineFrequency)),
                    Chip(label: Text(routine.routineTime)),
                  ]),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            )));
  }
}
