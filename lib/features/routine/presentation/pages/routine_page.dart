import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:routine2/core/error/error_pages/error_page.dart';
import 'package:routine2/core/error/error_pages/no_result_found_page.dart';
import 'package:routine2/core/loading_indicator/simple_loading_indicator.dart';
import 'package:routine2/features/routine/presentation/bloc/fetch_routines_bloc/fetch_routines_bloc.dart';
import 'package:routine2/features/routine/presentation/widgets/routine_page_widgets/routine_loaded_state.dart';

class RoutinePage extends StatefulWidget {
  RoutinePage({Key? key}) : super(key: key);

  @override
  State<RoutinePage> createState() => _RoutinePageState();
}

class _RoutinePageState extends State<RoutinePage> {
  @override
  Widget build(BuildContext context) {
     TextTheme primaryTextTheme = Theme.of(context).primaryTextTheme;
    return Scaffold(
      appBar: AppBar(title:Text('Routine App')),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
          },
          tooltip: 'Add new Routine',
          child: new Icon(Icons.add),
        ),
      body: BlocConsumer<FetchRoutinesBloc, FetchRoutinesState>(
        listener: (context, state) {
          
        },
        builder: (context, state) {

          return state is FetchRoutinesLoaded && state.routineList.isEmpty?noResultFoundPage(context: context, message: "You have not registered any routine"):
         state is FetchRoutinesLoaded? routineLoadedState(routineList: state.routineList) : state is FetchRoutinesLoading?
          simpleLoadingIndicator(
                          primaryTextTheme: primaryTextTheme)
                      : state is FetchRoutinesError
                          ? errorPage(
                              context: context,
                              errorMessage: state.errorMessage,
                              onTapped: () {
                                BlocProvider.of<FetchRoutinesBloc>(
                                        context)
                                    .add(FetchAllRoutinesEvent());
                              })
                              : Container();
       
        },
      ),
    );
  }
}