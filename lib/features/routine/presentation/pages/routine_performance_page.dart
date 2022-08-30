import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:routine2/core/general_widgets/custom_app_bar.dart';
import 'package:provider/provider.dart';
import 'package:routine2/core/state_manager/routine_state_manage.dart';
import 'package:routine2/core/utils/performance_calculator.dart';

class CalculateRoutineCheckPerformance extends StatefulWidget {
  const CalculateRoutineCheckPerformance({Key? key}) : super(key: key);

  @override
  State<CalculateRoutineCheckPerformance> createState() => _CalculateRoutineCheckPerformanceState();
}

class _CalculateRoutineCheckPerformanceState extends State<CalculateRoutineCheckPerformance> {
  late int numberOfRoutineCompleted;
  late int numberOfRoutineMissed;
  late String completionPercent;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
   numberOfRoutineCompleted = Provider.of<RoutineStateManager>(context, listen: false).completedRoutineIDs.length;
   numberOfRoutineMissed = Provider.of<RoutineStateManager>(context, listen: false).missedRoutineIDs.length;
   completionPercent= completionPerformancePercent(numberOfTaskCompleted: numberOfRoutineCompleted, numberOfTaskMissed: numberOfRoutineMissed);
  }
  @override
  Widget build(BuildContext context) {
    TextTheme primaryTextTheme = Theme.of(context).primaryTextTheme;
    return Scaffold(
      appBar: customAppBar(
          title: 'Routine Performance',
          context: context,
          primaryTextTheme: primaryTextTheme),
       body: ListView(
    physics: const NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    children: [
     const  SizedBox(height: 50,),
      Center(child: Text('Performance result : $completionPercent% ', style: primaryTextTheme.headline2,)),
     const SizedBox(height: 100,),
      int.parse(completionPercent) ==0 && (numberOfRoutineCompleted+ numberOfRoutineMissed)==0?/// no routine missed or marked
     Align(
       alignment: Alignment.center,
       child: SizedBox(
         width: 100,
         child: Image.asset('assets/images/emoji/just_there_emoji.png', width: 100,)),
     ):int.parse(completionPercent) < 70? /// Missed about 70% of the routines
     Align(
       alignment: Alignment.center,
       child: SizedBox(
         width: 100,
         child: Image.asset('assets/images/emoji/sad_face_emoji.png', width: 100,)),
     ):
     Align(
       alignment: Alignment.center,
       child: SvgPicture.asset('assets/svg/thumbs.svg', width: 150,),
     ),/// completed more than 70 percent of the routines

     const SizedBox(height: 50,),
      Align(
        alignment: Alignment.center,
        child: SizedBox(
          width: MediaQuery.of(context).size.width*0.8,
          child: Text(int.parse(completionPercent) ==0 && (numberOfRoutineCompleted+ numberOfRoutineMissed)==0?
          'No routine performed so far. \nSo none missed, none caught':int.parse(completionPercent) < 70?'Umm, you have missed most of your routines':'Good job, you have over 70% check rate ', textAlign: TextAlign.center, style: primaryTextTheme.headline3!.copyWith(color: Theme.of(context).primaryColor),),
        )),
     const SizedBox(height: 20,),
     const SizedBox(height: 30,),
      
    ],
       ),
    );
  }
}


